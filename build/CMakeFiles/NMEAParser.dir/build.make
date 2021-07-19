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
CMAKE_BINARY_DIR = /home/pi/masters_project/binauralsensoryaugmentation/build

# Utility rule file for NMEAParser.

# Include the progress variables for this target.
include CMakeFiles/NMEAParser.dir/progress.make

CMakeFiles/NMEAParser: CMakeFiles/NMEAParser-complete


CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-install
CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-mkdir
CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-download
CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-update
CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-patch
CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-configure
CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-build
CMakeFiles/NMEAParser-complete: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'NMEAParser'"
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles
	/usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles/NMEAParser-complete
	/usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-done

NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-install: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'NMEAParser'"
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-build && $(MAKE) install
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-build && /usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-install

NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'NMEAParser'"
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-build
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/tmp
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src
	/usr/bin/cmake -E make_directory /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp
	/usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-mkdir

NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-download: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-gitinfo.txt
NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-download: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'NMEAParser'"
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src && /usr/bin/cmake -P /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/tmp/NMEAParser-gitclone.cmake
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src && /usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-download

NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-update: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Performing update step for 'NMEAParser'"
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser && /usr/bin/cmake -P /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/tmp/NMEAParser-gitupdate.cmake

NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-patch: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'NMEAParser'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-patch

NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-configure: NMEAParser-prefix/tmp/NMEAParser-cfgcmd.txt
NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-configure: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-update
NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-configure: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'NMEAParser'"
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-build && /usr/bin/cmake "-GUnix Makefiles" /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-build && /usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-configure

NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-build: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'NMEAParser'"
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-build && $(MAKE)
	cd /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-build && /usr/bin/cmake -E touch /home/pi/masters_project/binauralsensoryaugmentation/build/NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-build

NMEAParser: CMakeFiles/NMEAParser
NMEAParser: CMakeFiles/NMEAParser-complete
NMEAParser: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-install
NMEAParser: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-mkdir
NMEAParser: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-download
NMEAParser: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-update
NMEAParser: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-patch
NMEAParser: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-configure
NMEAParser: NMEAParser-prefix/src/NMEAParser-stamp/NMEAParser-build
NMEAParser: CMakeFiles/NMEAParser.dir/build.make

.PHONY : NMEAParser

# Rule to build all files generated by this target.
CMakeFiles/NMEAParser.dir/build: NMEAParser

.PHONY : CMakeFiles/NMEAParser.dir/build

CMakeFiles/NMEAParser.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/NMEAParser.dir/cmake_clean.cmake
.PHONY : CMakeFiles/NMEAParser.dir/clean

CMakeFiles/NMEAParser.dir/depend:
	cd /home/pi/masters_project/binauralsensoryaugmentation/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/masters_project/binauralsensoryaugmentation /home/pi/masters_project/binauralsensoryaugmentation /home/pi/masters_project/binauralsensoryaugmentation/build /home/pi/masters_project/binauralsensoryaugmentation/build /home/pi/masters_project/binauralsensoryaugmentation/build/CMakeFiles/NMEAParser.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/NMEAParser.dir/depend
