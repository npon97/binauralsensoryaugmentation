# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/Software

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild

# Include any dependencies generated for this target.
include NMEAParserTest/CMakeFiles/NMEAParserTest.dir/depend.make

# Include the progress variables for this target.
include NMEAParserTest/CMakeFiles/NMEAParserTest.dir/progress.make

# Include the compile flags for this target's objects.
include NMEAParserTest/CMakeFiles/NMEAParserTest.dir/flags.make

NMEAParserTest/CMakeFiles/NMEAParserTest.dir/main.cpp.o: NMEAParserTest/CMakeFiles/NMEAParserTest.dir/flags.make
NMEAParserTest/CMakeFiles/NMEAParserTest.dir/main.cpp.o: /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserTest/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object NMEAParserTest/CMakeFiles/NMEAParserTest.dir/main.cpp.o"
	cd /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserTest && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserTest.dir/main.cpp.o -c /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserTest/main.cpp

NMEAParserTest/CMakeFiles/NMEAParserTest.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserTest.dir/main.cpp.i"
	cd /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserTest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserTest/main.cpp > CMakeFiles/NMEAParserTest.dir/main.cpp.i

NMEAParserTest/CMakeFiles/NMEAParserTest.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserTest.dir/main.cpp.s"
	cd /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserTest && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserTest/main.cpp -o CMakeFiles/NMEAParserTest.dir/main.cpp.s

# Object files for target NMEAParserTest
NMEAParserTest_OBJECTS = \
"CMakeFiles/NMEAParserTest.dir/main.cpp.o"

# External object files for target NMEAParserTest
NMEAParserTest_EXTERNAL_OBJECTS =

NMEAParserTest/NMEAParserTest: NMEAParserTest/CMakeFiles/NMEAParserTest.dir/main.cpp.o
NMEAParserTest/NMEAParserTest: NMEAParserTest/CMakeFiles/NMEAParserTest.dir/build.make
NMEAParserTest/NMEAParserTest: NMEAParserLib/libNMEAParserLib.a
NMEAParserTest/NMEAParserTest: NMEAParserTest/CMakeFiles/NMEAParserTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable NMEAParserTest"
	cd /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserTest && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/NMEAParserTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
NMEAParserTest/CMakeFiles/NMEAParserTest.dir/build: NMEAParserTest/NMEAParserTest

.PHONY : NMEAParserTest/CMakeFiles/NMEAParserTest.dir/build

NMEAParserTest/CMakeFiles/NMEAParserTest.dir/clean:
	cd /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserTest && $(CMAKE_COMMAND) -P CMakeFiles/NMEAParserTest.dir/cmake_clean.cmake
.PHONY : NMEAParserTest/CMakeFiles/NMEAParserTest.dir/clean

NMEAParserTest/CMakeFiles/NMEAParserTest.dir/depend:
	cd /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/Software /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserTest /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserTest /home/pi/Projects/mece2021/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserTest/CMakeFiles/NMEAParserTest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : NMEAParserTest/CMakeFiles/NMEAParserTest.dir/depend

