/*
 * LSM303AGR_MAG.h  Created on: 24 June 2021
 * Copyright (c) 2021 Nathan Phipps O'Neill (www.nathanphippsoneill.com)
 * Licensed under the EUPL V.1.1
 *
 * This Software is provided to You under the terms of the European 
 * Union Public License (the "EUPL") version 1.1 as published by the 
 * European Union. Any use of this Software, other than as authorized 
 * under this License is strictly prohibited (to the extent such use 
 * is covered by a right of the copyright holder of this Software).
 * 
 * This Software is provided under the License on an "AS IS" basis and 
 * without warranties of any kind concerning the Software, including 
 * without limitation merchantability, fitness for a particular purpose, 
 * absence of defects or errors, accuracy, and non-infringement of 
 * intellectual property rights other than copyright. This disclaimer 
 * of warranty is an essential part of the License and a condition for 
 * the grant of any rights to this Software.
 * 
 * Many parts are specifically modified from or inspired by Derek Molloy's
 * chapter 8 repository code which can be found here:
 * https://github.com/derekmolloy/exploringrpi/blob/master/chp08/i2c/
 * 
 * [WARNING]: Registers marked as Reserved must not be changed. Writing to those
 *            registers may cause permanent damage to the device.
 */


#ifndef LSM303AGR_MAG_H_
#define LSM303AGR_MAG_H_

#include "I2CDevice.h"
#include <stdint.h>

/* On the LSM303AGR, registers 40h through 6Fh are dedicated to the magnetometer.
*  Because there are reserved registers, there are 3 buffers of registers which
*  are defined so that those reserved registers are not read from or written to.
*  These buffers are defined as follows:
*  * 0x45 -> 0x4A = BUFFER_OFFSET
*  * 0x4F         = BUFFER_DEVID
*  * 0x60 -> 0x6D = BUFFER_CFG_STATUS_DATA
* 
*  Each of these buffers' sizes are then defined
*/

#define BUFFER_OFFSET_SIZE      0x06
#define BUFFER_DEVID_SIZE       0x01
#define BUFFER_CFG_STATUS_DATA  0x0E

class LSM303AGR_MAG : protected I2CDevice
{
public:
    // Resolution and power mode of the sensor
    enum RESOLUTION
    {
        HIGH = 0, // High resolution high power
        LOW = 1   // Low resolution low power
    };

    // Output data rate (ODR)
    enum OUTPUT_DATA_RATE
    {
        TEN_HERTZ = 0,
        TWENTY_HERTZ = 1, // This can be 2 as well
        HUNDRED_HERTZ = 3
    };

    enum SYSTEM_MODE
    {
        CONTINUOUS = 0, // Continously fills raw data registers
        SINGLE = 1,     // Performs a single measurement, sets DRDY high and
                        // returns to idle mode.
        IDLE = 2        // This can be 3 as well
    };

private:
    unsigned int I2CBus, I2CAddress;
    uint8_t *registers;
    LSM303AGR_MAG::RESOLUTION resolution;
    LSM303AGR_MAG::OUTPUT_DATA_RATE outputDataRate;
    LSM303AGR_MAG::SYSTEM_MODE systemMode;
    uint16_t magX, magY, magZ; // Raw 2's complement magnetic values

    uint16_t combineRegisters(uint8_t msb, uint8_t lsb);
    virtual int updateRegisters();

public:
    LSM303AGR_MAG(unsigned int I2CBus, unsigned int I2CAddress = 0x1E);
    virtual int readSensorState();

    virtual void setResolution(LSM303AGR_MAG::RESOLUTION resolution);
    virtual LSM303AGR_MAG::RESOLUTION getResolution();
    virtual void setOutputDataRate(
        LSM303AGR_MAG::OUTPUT_DATA_RATE outputDataRate);
    virtual LSM303AGR_MAG::OUTPUT_DATA_RATE getOutputDataRate();
    virtual void setSystemMode(LSM303AGR_MAG::SYSTEM_MODE systemMode);
    virtual LSM303AGR_MAG::SYSTEM_MODE getSystemMode();

    virtual uint16_t getMagX() { return this->magX; }
    virtual uint16_t getMagY() { return this->magY; }
    virtual uint16_t getMagZ() { return this->magZ; }

    virtual ~LSM303AGR_MAG();
};

#endif /* LSM303AGR_MAG_H_ */