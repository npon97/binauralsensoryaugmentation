#include "I2CDevice.h"
#include "LSM303AGR_MAG.h"
#include <iostream>
#include <unistd.h>
#include <fstream>

int main(int argc, char* argv[])
{
    int i = 0;
    LSM303AGR_MAG* magnetometer;

    // Create an accelerometer object
    try
    {
        magnetometer = new LSM303AGR_MAG(1, 0x1E);
    }
    catch(int i) // Stops the program if any errors occur
    {
        perror("\nAborting: Magnetometer Object could not be created.\n");
        return i;
    }

    //magnetometer->displayPositionalData();
    magnetometer->storePositionalDataInCSV();

	return 0;
}