cmake_minimum_required(VERSION 3.16)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")

project(binauralsensoryaugmenation)

add_executable(
    binauralsensoryaugmentation
    main.cpp
    I2CDevice.cpp
    LSM303AGR_MAG.cpp
    ./NMEAParser/Software/NMEAParserLib/NMEAParser.cpp
)
