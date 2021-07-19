cmake_minimum_required(VERSION 3.16)

set(CMAKE_BUILD_TYPE Debug)

project(binauralsensoryaugmenation)
set(EXECUTABLE_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/bin")

#For the static library:
set ( PROJECT_LINK_LIBS libNMEAParserLib.a)
link_directories(
    "${PROJECT_SOURCE_DIR}/lib/NMEAParser/NMEAParserBuild/NMEAParserLib")
include_directories(
    "${PROJECT_SOURCE_DIR}/lib/NMEAParser/Software/NMEAParserLib")

include_directories("${PROJECT_SOURCE_DIR}/include")

file(GLOB SOURCES "src/*.cpp")

add_executable(binauralsensoryaugmentation ${SOURCES})
target_link_libraries(binauralsensoryaugmentation ${PROJECT_LINK_LIBS} )