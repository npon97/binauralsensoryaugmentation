#include "I2CDevice.h"
#include "PA1010D.h"
#include "LSM303AGR_MAG.h"
#include <iostream>
#include <unistd.h>
#include <fstream>

int main(int argc, char* argv[])
{
    int i = 0;
    LSM303AGR_MAG* magnetometer;
    PA1010D* gps;

    // Create an accelerometer object
    try
    {
        magnetometer = new LSM303AGR_MAG(1, 0x1E);
        gps = new PA1010D("GNGGA", 1, 0x10);
    }
    catch(int i) // Stops the program if any errors occur
    {
        perror("\nAborting: Magnetometer Object could not be created.\n");
        return i;
    }

    if(argc == 1)
    {
        if(argv[0] == "--storecsv")
        {
            magnetometer->storePositionalDataInCSV();
            return 0;
        }
    }

    magnetometer->displayPositionalData();



	return 0;
}