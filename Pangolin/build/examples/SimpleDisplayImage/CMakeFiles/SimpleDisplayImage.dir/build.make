# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build

# Include any dependencies generated for this target.
include examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/depend.make

# Include the progress variables for this target.
include examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/progress.make

# Include the compile flags for this target's objects.
include examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/flags.make

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o: examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/flags.make
examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o: ../examples/SimpleDisplayImage/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o"
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/examples/SimpleDisplayImage && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/SimpleDisplayImage.dir/main.cpp.o -c /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/examples/SimpleDisplayImage/main.cpp

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SimpleDisplayImage.dir/main.cpp.i"
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/examples/SimpleDisplayImage && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/examples/SimpleDisplayImage/main.cpp > CMakeFiles/SimpleDisplayImage.dir/main.cpp.i

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SimpleDisplayImage.dir/main.cpp.s"
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/examples/SimpleDisplayImage && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/examples/SimpleDisplayImage/main.cpp -o CMakeFiles/SimpleDisplayImage.dir/main.cpp.s

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.requires:

.PHONY : examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.requires

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.provides: examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.requires
	$(MAKE) -f examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/build.make examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.provides.build
.PHONY : examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.provides

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.provides.build: examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o


# Object files for target SimpleDisplayImage
SimpleDisplayImage_OBJECTS = \
"CMakeFiles/SimpleDisplayImage.dir/main.cpp.o"

# External object files for target SimpleDisplayImage
SimpleDisplayImage_EXTERNAL_OBJECTS =

examples/SimpleDisplayImage/SimpleDisplayImage: examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o
examples/SimpleDisplayImage/SimpleDisplayImage: examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/build.make
examples/SimpleDisplayImage/SimpleDisplayImage: src/libpangolin.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libGLU.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libGL.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libGLEW.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libSM.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libICE.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libX11.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libXext.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libGLU.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libGL.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libGLEW.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libSM.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libICE.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libX11.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libXext.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libpython2.7.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libdc1394.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libavcodec.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libavformat.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libavutil.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libswscale.so
examples/SimpleDisplayImage/SimpleDisplayImage: /opt/ros/kinetic/lib/librealsense.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/libOpenNI.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libpng.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libz.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libjpeg.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libtiff.so
examples/SimpleDisplayImage/SimpleDisplayImage: /usr/lib/x86_64-linux-gnu/libIlmImf.so
examples/SimpleDisplayImage/SimpleDisplayImage: examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable SimpleDisplayImage"
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/examples/SimpleDisplayImage && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SimpleDisplayImage.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/build: examples/SimpleDisplayImage/SimpleDisplayImage

.PHONY : examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/build

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/requires: examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/main.cpp.o.requires

.PHONY : examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/requires

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/clean:
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/examples/SimpleDisplayImage && $(CMAKE_COMMAND) -P CMakeFiles/SimpleDisplayImage.dir/cmake_clean.cmake
.PHONY : examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/clean

examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/depend:
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/examples/SimpleDisplayImage /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/examples/SimpleDisplayImage /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/SimpleDisplayImage/CMakeFiles/SimpleDisplayImage.dir/depend

