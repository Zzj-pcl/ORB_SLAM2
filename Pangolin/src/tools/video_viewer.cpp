#include <pangolin/tools/video_viewer.h>

#include <pangolin/pangolin.h>
#include <pangolin/video/video_input.h>
#include <pangolin/gl/gltexturecache.h>
#include <pangolin/gl/glpixformat.h>
#include <pangolin/handler/handler_image.h>
#include <pangolin/utils/file_utils.h>
#include <pangolin/utils/timer.h>
#include <pangolin/display/image_view.h>
#include <pangolin/utils/sigstate.h>


namespace pangolin
{

void videoviewer_signal_quit(int) {
    pango_print_info("Caught signal. Program will exit after any IO is complete.\n");
    pangolin::QuitAll();
}

VideoViewer::VideoViewer(const std::string& window_name, const std::string& input_uri, const std::string& output_uri)
    : window_name(window_name),
      video_playback(nullptr),
      output_uri(output_uri),
      current_frame(-1),
      grab_until(std::numeric_limits<int>::max()),
      record_nth_frame(1),
      video_grab_wait(true),
      video_grab_newest(false),
      should_run(true)
{
    pangolin::Var<int>::Attach("ui.frame", current_frame);

    if(!input_uri.empty()) {
        OpenInput(input_uri);
    }

    vv_thread = std::thread(&VideoViewer::Run, this);
}

VideoViewer::~VideoViewer()
{
    Quit();

    // Wait for programming to close.
    if(vv_thread.joinable()) {
        vv_thread.join();
    }
}

void VideoViewer::Quit()
{
    should_run = false;
}

void VideoViewer::Run()
{
    /////////////////////////////////////////////////////////////////////////
    /// Register pangolin variables
    /////////////////////////////////////////////////////////////////////////

    std::unique_ptr<unsigned char[]> buffer(new unsigned char[video.SizeBytes()+1]);

    const int slider_size = (TotalFrames() < std::numeric_limits<int>::max() ? 20 : 0);

    // Create OpenGL window - guess sensible dimensions
    pangolin::CreateWindowAndBind( window_name,
        (int)(video.Width() * video.Streams().size()),
        (int)(video.Height() + slider_size)
    );
    glEnable (GL_BLEND);
    glBlendFunc (GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    pangolin::Var<int> frame("ui.frame");
    pangolin::Slider frame_slider("frame", frame.Ref() );

    if(video_playback && TotalFrames() < std::numeric_limits<int>::max())
    {
        // frame_slider should be added first so that it can be rendered correctly.
        pangolin::DisplayBase().AddDisplay(frame_slider);
        frame_slider.SetBounds(0.0, pangolin::Attach::Pix(slider_size), 0.0, 1.0);
    }

    pangolin::View& container = pangolin::Display("streams");
    container.SetLayout(pangolin::LayoutEqual)
             .SetBounds(pangolin::Attach::Pix(slider_size), 1.0, 0.0, 1.0);

    std::vector<ImageView> stream_views(video.Streams().size());
    for(auto& sv : stream_views) {
        container.AddDisplay(sv);
    }

    pangolin::View& record_graphic = pangolin::Display("record_glyth").
            SetBounds(pangolin::Attach::Pix(-28),1.0f, pangolin::Attach::Pix(-28), 1.0f);
    record_graphic.extern_draw_function = [&](pangolin::View& v){
        if(video.IsRecording()) {
            v.ActivatePixelOrthographic();
            pangolin::glRecordGraphic(14.0f, 14.0f, 7.0f);
        }
    };

    std::vector<pangolin::Image<unsigned char> > images;

    /////////////////////////////////////////////////////////////////////////
    /// Register key shortcuts
    /////////////////////////////////////////////////////////////////////////

    RegisterDefaultKeyShortcutsAndPangoVariables();

    const char show_hide_keys[]  = {'1','2','3','4','5','6','7','8','9'};
    const char screenshot_keys[] = {'!','@','#','$','%','^','&','*','('};

    // Show/hide streams
    for(size_t v=0; v < container.NumChildren() && v < 9; v++) {
        pangolin::RegisterKeyPressCallback(show_hide_keys[v], [v,&container](){
            container[v].ToggleShow();
        } );
        pangolin::RegisterKeyPressCallback(screenshot_keys[v], [this,v,&images](){
            if(v < images.size() && images[v].ptr) {
                try{
                    pangolin::SaveImage(
                        images[v], video.Streams()[v].PixFormat(),
                        pangolin::MakeUniqueFilename("capture.png")
                    );
                }catch(std::exception e){
                    pango_print_error("Unable to save frame: %s\n", e.what());
                }
            }
        } );
    }

    video.Start();

    // Stream and display video
    while(should_run && !pangolin::ShouldQuit())
    {
        glClear(GL_DEPTH_BUFFER_BIT | GL_COLOR_BUFFER_BIT);
        glColor3f(1.0f, 1.0f, 1.0f);

        {
            std::lock_guard<std::mutex> lock(control_mutex);

            if(frame.GuiChanged()) {
                if(video_playback) {
                    frame = video_playback->Seek(frame) -1;
                }
                grab_until = frame + 1;
            }

            if ( frame < grab_until && video.Grab(&buffer[0], images, video_grab_wait, video_grab_newest)) {
                frame = frame +1;

                // Update images
                for(unsigned int i=0; i<images.size(); ++i) {
                    stream_views[i].SetImage(images[i], pangolin::GlPixFormat(video.Streams()[i].PixFormat() ));
                }
            }
        }

        // leave in pixel orthographic for slider to render.
        pangolin::DisplayBase().ActivatePixelOrthographic();
        pangolin::FinishFrame();
    }

    pangolin::DestroyWindow(window_name);
}

void VideoViewer::RegisterDefaultKeyShortcutsAndPangoVariables()
{
    pangolin::RegisterKeyPressCallback(' ', [this](){TogglePlay();} );
    pangolin::RegisterKeyPressCallback('r', [this](){ToggleRecord();});
    pangolin::RegisterKeyPressCallback('w', [this](){ToggleWaitForFrames();} );
    pangolin::RegisterKeyPressCallback('d', [this](){ToggleDiscardBufferedFrames();} );
    pangolin::RegisterKeyPressCallback(',', [this](){Skip(-1);} );
    pangolin::RegisterKeyPressCallback('.', [this](){Skip(+1);} );
    pangolin::RegisterKeyPressCallback('<', [this](){Skip(-FRAME_SKIP);} );
    pangolin::RegisterKeyPressCallback('>', [this](){Skip(+FRAME_SKIP);} );
    pangolin::RegisterKeyPressCallback('0', [this](){RecordOneFrame();} );
}

void VideoViewer::OpenInput(const std::string& input_uri)
{
    std::lock_guard<std::mutex> lock(control_mutex);
    video.Open(input_uri, output_uri);

    // Output details of video stream
    for(size_t s = 0; s < video.Streams().size(); ++s) {
        const pangolin::StreamInfo& si = video.Streams()[s];
        std::cout << FormatString(
            "Stream %: % x % % (pitch: % bytes",
            s, si.Width(), si.Height(), si.PixFormat().format, si.Pitch()
        ) << std::endl;
    }

    if(video.Streams().size() == 0) {
        pango_print_error("No video streams from device.\n");
        return;
    }

    video_playback = pangolin::FindFirstMatchingVideoInterface<pangolin::VideoPlaybackInterface>(video);
    if(TotalFrames() < std::numeric_limits<int>::max() ) {
        std::cout << "Video length: " << TotalFrames() << " frames" << std::endl;
        grab_until = 0;
    }

    pangolin::Var<int> frame("ui.frame");
    frame.Meta().range[0] = 0;
    frame.Meta().range[1] = TotalFrames()-1;
}

void VideoViewer::CloseInput()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    video.Close();
}

void VideoViewer::Record()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    video.Record();
}

void VideoViewer::RecordOneFrame()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    video.RecordOneFrame();
}

void VideoViewer::StopRecording()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    if(video.IsRecording()) {
        video.Stop();
    }
}

void VideoViewer::TogglePlay()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    grab_until = (current_frame < grab_until) ? current_frame: std::numeric_limits<int>::max();
}

void VideoViewer::ToggleRecord()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    if(!video.IsRecording()) {
        video.SetTimelapse( static_cast<size_t>(record_nth_frame) );
        video.Record();
        pango_print_info("Started Recording.\n");
    }else{
        video.Stop();
        pango_print_info("Finished recording.\n");
    }
    fflush(stdout);
}

void VideoViewer::ToggleDiscardBufferedFrames()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    video_grab_newest = !video_grab_newest;
    if(video_grab_newest) {
        pango_print_info("Discarding old frames.\n");
    }else{
        pango_print_info("Not discarding old frames.\n");
    }
}

void VideoViewer::ToggleWaitForFrames()
{
    std::lock_guard<std::mutex> lock(control_mutex);
    video_grab_wait = !video_grab_wait;
    if(video_grab_wait) {
        pango_print_info("Gui wait's for video frame.\n");
    }else{
        pango_print_info("Gui doesn't wait for video frame.\n");
    }
}

void VideoViewer::Skip(int frames)
{
    std::lock_guard<std::mutex> lock(control_mutex);

    if(video_playback) {
        current_frame = video_playback->Seek(current_frame + frames) -1;
        grab_until = current_frame + 1;
    }else{
        if(frames >= 0) {
            grab_until = current_frame + frames;
        }else{
            pango_print_warn("Unable to skip backward.");
        }
    }

}

void VideoViewer::WaitUntilExit()
{
    if(vv_thread.joinable()) {
        vv_thread.join();
    }
}


void RunVideoViewerUI(const std::string& input_uri, const std::string& output_uri)
{
    RegisterNewSigCallback(videoviewer_signal_quit, nullptr, SIGINT);
    RegisterNewSigCallback(videoviewer_signal_quit, nullptr, SIGTERM);

    VideoViewer vv("VideoViewer", input_uri, output_uri);
    vv.WaitUntilExit();
}

}
