# Binaural Sensory Augmentation Repository

This project is a master's project by Nathan Phipps O'Neill. The code in this 
 repository aims to interact with a GPS, magnetometer and headphones to augment
 a human's navigational ability with audio.

## Wiki
### Setup of I2C interface
The project was built on a Raspberry Pi 3 B+ with Raspbian OS and I2C 
 functionality enabled. To enable I2C functionality, first type 
 `sudo raspi-config` into the terminal and select 
 `Interface Options > I2C > Yes`.

### (Prerequisite) Building the project
Familiarise yourself with `cmake` as it is the build tool of choice for this 
project. Briefly, cmake is a tool to manage building of source code and allows 
the project to implement a scalable and structured code base. It also allows 
implementing test functionality and managing 3rd party dependencies with 
relative ease (depending on your experience level of cmake).  

### Building the project
To build the project do these steps (where `<project_root_dir>` is the place 
where the project was installed/cloned to):
`   cd <project_root_dir>/build`  
`   make clean`  
`   make`  
If this does not work, change into the build directory and clear it as follows:
`   cd <project_root_dir>/build`
`   rm -rf *`
`   cmake ..`
Then made sure that the NMEAParser Library is added to your include path.

### Example of an NMEA GGA sentence
`
$GNGGA,1413,14.083,,,,,0,0,,,M,,M,,*5F
`
### The NMEA parser
A 3rd party NMEA parser is used to parse the sentence from the PA1010D. This 
will simplify the process of getting numerical values from textual data. 
The NMEAParser was downloaded on July 18 2021 but that version should be 
contained within this project as the licence permits it.  

More on this project can be found 
[here](https://github.com/VisualGPS/NMEAParser):  
https://github.com/VisualGPS/NMEAParser

If the parser library is modified at all or this is the first 
time running the program, these steps must be taken for 
the changes to take effect:  
`   cd <project_root_dir>/lib/NMEAParser/NMEAParserBuild`  
`   cmake ../Software/`  
`   make`  
`   cd <project_root_dir>/build`  
`   make clean`  
`   make`  

### The difference in Axes
With OpenAL and the real world, the listener and source objects are located in 3D 
space. With the LSM303AGR magnetometer, the axes are oriented in a different way to 
the OpenAL framework. This difference is important when converting between the two 
coordinate systems.