#include "I2CDevice.h"
#include "LSM303AGR_MAG.h"
#include <iostream>
#include <unistd.h>

int main(int argc, char* argv[])
{
    int i = 0;
    LSM303AGR_MAG* magnetometer;
    unsigned char* mag_out;

    // Create an accelerometer object
    try
    {
        magnetometer = new LSM303AGR_MAG(1);
    }
    catch(int i) // Stops the program if any errors occur
    {
        perror("\nAborting: Magnetometer Object could not be created.\n");
        return i;
    }

    magnetometer->displayAzimuthAndElevation();

	return 0;
}
