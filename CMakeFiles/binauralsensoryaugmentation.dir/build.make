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
CMAKE_SOURCE_DIR = /home/pi/masters_project/binauralsensoryaugmentation

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/masters_project/binauralsensoryaugmentation

# Include any dependencies generated for this target.
include CMakeFiles/binauralsensoryaugmentation.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/binauralsensoryaugmentation.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/binauralsensoryaugmentation.dir/flags.make

CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.o: CMakeFiles/binauralsensoryaugmentation.dir/flags.make
CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.o: main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/main.cpp

CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/main.cpp > CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.i

CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/main.cpp -o CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.s

CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.o: CMakeFiles/binauralsensoryaugmentation.dir/flags.make
CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.o: I2CDevice.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/I2CDevice.cpp

CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/I2CDevice.cpp > CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.i

CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/I2CDevice.cpp -o CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.s

CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.o: CMakeFiles/binauralsensoryaugmentation.dir/flags.make
CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.o: LSM303AGR_MAG.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/LSM303AGR_MAG.cpp

CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/LSM303AGR_MAG.cpp > CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.i

CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/LSM303AGR_MAG.cpp -o CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.s

CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.o: CMakeFiles/binauralsensoryaugmentation.dir/flags.make
CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.o: NMEAParser/Software/NMEAParserLib/NMEAParser.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.o -c /home/pi/masters_project/binauralsensoryaugmentation/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp

CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/masters_project/binauralsensoryaugmentation/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp > CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.i

CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/masters_project/binauralsensoryaugmentation/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp -o CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.s

# Object files for target binauralsensoryaugmentation
binauralsensoryaugmentation_OBJECTS = \
"CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.o" \
"CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.o" \
"CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.o" \
"CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.o"

# External object files for target binauralsensoryaugmentation
binauralsensoryaugmentation_EXTERNAL_OBJECTS =

binauralsensoryaugmentation: CMakeFiles/binauralsensoryaugmentation.dir/main.cpp.o
binauralsensoryaugmentation: CMakeFiles/binauralsensoryaugmentation.dir/I2CDevice.cpp.o
binauralsensoryaugmentation: CMakeFiles/binauralsensoryaugmentation.dir/LSM303AGR_MAG.cpp.o
binauralsensoryaugmentation: CMakeFiles/binauralsensoryaugmentation.dir/NMEAParser/Software/NMEAParserLib/NMEAParser.cpp.o
binauralsensoryaugmentation: CMakeFiles/binauralsensoryaugmentation.dir/build.make
binauralsensoryaugmentation: CMakeFiles/binauralsensoryaugmentation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable binauralsensoryaugmentation"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/binauralsensoryaugmentation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/binauralsensoryaugmentation.dir/build: binauralsensoryaugmentation

.PHONY : CMakeFiles/binauralsensoryaugmentation.dir/build

CMakeFiles/binauralsensoryaugmentation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/binauralsensoryaugmentation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/binauralsensoryaugmentation.dir/clean

CMakeFiles/binauralsensoryaugmentation.dir/depend:
	cd /home/pi/masters_project/binauralsensoryaugmentation && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/masters_project/binauralsensoryaugmentation /home/pi/masters_project/binauralsensoryaugmentation /home/pi/masters_project/binauralsensoryaugmentation /home/pi/masters_project/binauralsensoryaugmentation /home/pi/masters_project/binauralsensoryaugmentation/CMakeFiles/binauralsensoryaugmentation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/binauralsensoryaugmentation.dir/depend
