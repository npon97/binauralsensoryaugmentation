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
CMAKE_SOURCE_DIR = /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild

# Include any dependencies generated for this target.
include NMEAParserLib/CMakeFiles/NMEAParserLib.dir/depend.make

# Include the progress variables for this target.
include NMEAParserLib/CMakeFiles/NMEAParserLib.dir/progress.make

# Include the compile flags for this target's objects.
include NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.o: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.o: /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParserPacket.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.o"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParserPacket.cpp

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.i"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParserPacket.cpp > CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.i

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.s"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParserPacket.cpp -o CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.s

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.o: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.o: /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.o"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.i"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp > CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.i

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.s"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp -o CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.s

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.o: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.o: /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceBase.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.o"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceBase.cpp

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.i"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceBase.cpp > CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.i

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.s"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceBase.cpp -o CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.s

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.o: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.o: /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGGA.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.o"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGGA.cpp

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.i"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGGA.cpp > CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.i

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.s"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGGA.cpp -o CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.s

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.o: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.o: /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSV.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.o"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSV.cpp

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.i"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSV.cpp > CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.i

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.s"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSV.cpp -o CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.s

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.o: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.o: /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSA.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.o"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSA.cpp

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.i"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSA.cpp > CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.i

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.s"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceGSA.cpp -o CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.s

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.o: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/flags.make
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.o: /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceRMC.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.o"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceRMC.cpp

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.i"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceRMC.cpp > CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.i

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.s"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib/NMEASentenceRMC.cpp -o CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.s

# Object files for target NMEAParserLib
NMEAParserLib_OBJECTS = \
"CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.o" \
"CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.o" \
"CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.o" \
"CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.o" \
"CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.o" \
"CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.o" \
"CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.o"

# External object files for target NMEAParserLib
NMEAParserLib_EXTERNAL_OBJECTS =

NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParserPacket.cpp.o
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEAParser.cpp.o
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceBase.cpp.o
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGGA.cpp.o
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSV.cpp.o
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceGSA.cpp.o
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/NMEASentenceRMC.cpp.o
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/build.make
NMEAParserLib/libNMEAParserLib.a: NMEAParserLib/CMakeFiles/NMEAParserLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX static library libNMEAParserLib.a"
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && $(CMAKE_COMMAND) -P CMakeFiles/NMEAParserLib.dir/cmake_clean_target.cmake
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/NMEAParserLib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
NMEAParserLib/CMakeFiles/NMEAParserLib.dir/build: NMEAParserLib/libNMEAParserLib.a

.PHONY : NMEAParserLib/CMakeFiles/NMEAParserLib.dir/build

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/clean:
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib && $(CMAKE_COMMAND) -P CMakeFiles/NMEAParserLib.dir/cmake_clean.cmake
.PHONY : NMEAParserLib/CMakeFiles/NMEAParserLib.dir/clean

NMEAParserLib/CMakeFiles/NMEAParserLib.dir/depend:
	cd /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/Software/NMEAParserLib /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib /home/pi/masters_project/binauralsensoryaugmentation/lib/NMEAParser/NMEAParserBuild/NMEAParserLib/CMakeFiles/NMEAParserLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : NMEAParserLib/CMakeFiles/NMEAParserLib.dir/depend

