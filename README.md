# Binaural Sensory Augmentation

This project is a master's project by Nathan Phipps O'Neill. The code in this 
repository aims to interact with a GPS, magnetometer and headphones to augment
 a human's navigational ability with audio. 

### Example of a NMEA GGA sentence
`
$GNGGA,1413,14.083,,,,,0,0,,,M,,M,,*5F
`
## The NMEA parser
A 3rd party NMEA parser is used to parse the sentence from the PA1010D. This 
will simplify the process of getting numerical values from textual data. More 
on this project can be found [here](https://github.com/VisualGPS/NMEAParser): 
https://github.com/VisualGPS/NMEAParser