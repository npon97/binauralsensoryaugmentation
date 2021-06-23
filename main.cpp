#include "I2CDevice.h"
#include <iostream>
#include <unistd.h>

#define MAG_OUT_LEN 6
#define SUPERLOOP_S 1

int main(int argc, char* argv[])
{
    int i = 0;
    I2CDevice* magnetometer;
    unsigned char* mag_out;

    // Create an accelerometer object
    try
    {
        magnetometer = new I2CDevice(1, 0x1E);
    }
    catch(int i) // Stops the program if any errors occur
    {
        perror("\nAborting\n");
        return i;
    }

    // Read the x, y, z registers
    mag_out = magnetometer->readRegisters(MAG_OUT_LEN, 0x68);

    while(true)
    {
        for(i = 0; i < MAG_OUT_LEN; i++)
        {
            printf("%d\n", (int)mag_out[i]);
        }
        sleep(SUPERLOOP_S);
    }

	return 0;
}
