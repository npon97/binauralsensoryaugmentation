# Binaural Sensory Augmentation

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
To build the project

### Example of a NMEA GGA sentence
`
$GNGGA,1413,14.083,,,,,0,0,,,M,,M,,*5F
`
### The NMEA parser
A 3rd party NMEA parser is used to parse the sentence from the PA1010D. This 
will simplify the process of getting numerical values from textual data. More 
on this project can be found [here](https://github.com/VisualGPS/NMEAParser): 
https://github.com/VisualGPS/NMEAParser