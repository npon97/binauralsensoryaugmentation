cmake_minimum_required(VERSION 3.16)

project(binauralsensoryaugmenation)
set(EXECUTABLE_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/bin")
set(CMAKE_C_FLAGS_DEBUG "-g -DDEBUG")
set(CMAKE_CXX_FLAGS_DEBUG "-g -DDEBUG")

#For the static library:
set ( PROJECT_LINK_LIBS libNMEAParserLib.a)
link_directories(
    "${PROJECT_SOURCE_DIR}/lib/NMEAParser/NMEAParserBuild/NMEAParserLib")
include_directories(
    "${PROJECT_SOURCE_DIR}/lib/NMEAParser/Software/NMEAParserLib")

include_directories("${PROJECT_SOURCE_DIR}/include")

file(GLOB SOURCES "${PROJECT_SOURCE_DIR}/src/*.cpp"
 "${PROJECT_SOURCE_DIR}/lib/NMEAParser/Software/NMEAParserLib/*.cpp")

add_executable(binauralsensoryaugmentation ${SOURCES})
target_link_libraries(binauralsensoryaugmentation openal)
target_link_libraries(binauralsensoryaugmentation ${PROJECT_LINK_LIBS} )