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

# Utility rule file for install-mime-info.

# Include the progress variables for this target.
include tools/VideoViewer/CMakeFiles/install-mime-info.dir/progress.make

tools/VideoViewer/CMakeFiles/install-mime-info: tools/VideoViewer/VideoViewer
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && mkdir -p /home/scott/.local/share/mime/packages/
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && mkdir -p /home/scott/.local/share/applications/
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && mkdir -p /home/scott/.local/share/icons/hicolor/scalable/mimetypes/
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && cp /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/tools/VideoViewer/application-x-pango.xml /home/scott/.local/share/mime/packages/
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && cp /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/tools/VideoViewer/application-x-pango.svg /home/scott/.local/share/icons/hicolor/scalable/mimetypes/
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && cp /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer/pango.desktop /home/scott/.local/share/applications/
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && gtk-update-icon-cache /home/scott/.local/share/icons/hicolor -f -t
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && update-mime-database /home/scott/.local/share/mime
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && update-desktop-database /home/scott/.local/share/applications

install-mime-info: tools/VideoViewer/CMakeFiles/install-mime-info
install-mime-info: tools/VideoViewer/CMakeFiles/install-mime-info.dir/build.make

.PHONY : install-mime-info

# Rule to build all files generated by this target.
tools/VideoViewer/CMakeFiles/install-mime-info.dir/build: install-mime-info

.PHONY : tools/VideoViewer/CMakeFiles/install-mime-info.dir/build

tools/VideoViewer/CMakeFiles/install-mime-info.dir/clean:
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer && $(CMAKE_COMMAND) -P CMakeFiles/install-mime-info.dir/cmake_clean.cmake
.PHONY : tools/VideoViewer/CMakeFiles/install-mime-info.dir/clean

tools/VideoViewer/CMakeFiles/install-mime-info.dir/depend:
	cd /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/tools/VideoViewer /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer /home/scott/projects/ScottLab/ROS/catkin_ws/src/ORB_SLAM2/Pangolin/build/tools/VideoViewer/CMakeFiles/install-mime-info.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/VideoViewer/CMakeFiles/install-mime-info.dir/depend

