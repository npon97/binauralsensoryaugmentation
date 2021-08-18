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

    enum LOW_PASS_FILTER
    {
        DISABLE_LPF = 0,
        ENABLE_LPF = 1
    };

    enum OFFSET_CANCELLATION
    {
        DISABLE_OFFSET_CANC = 0,
        ENABLE_OFFSET_CANC = 1 // Enables offset cancellation
    };

private:
    unsigned int I2CBus, I2CAddress;
    uint8_t *registers;
    uint8_t *hard_iron_reg, *who_am_i_reg, *cfg_status_data_reg;
    RESOLUTION resolution;
    OUTPUT_DATA_RATE outputDataRate;
    SYSTEM_MODE systemMode;
    LOW_PASS_FILTER lpf;
    OFFSET_CANCELLATION off_canc;
    float magX_mG, magY_mG, magZ_mG; // Sensitivity adjusted magnetic values
    double azimuth_deg, elevation_deg;
    bool isHardIronDistortion; // Distortion attributes
    float max_magX_mG, max_magY_mG, max_magZ_mG,
          min_magX_mG, min_magY_mG, min_magZ_mG;

    short combineRegisters(unsigned char msb, unsigned char lsb);

    void calculateAzimuthAndElevation();
    void offsetHardIron();
    virtual int updateRegisters();

public:
    LSM303AGR_MAG(unsigned int I2CBus, unsigned int I2CAddress = 0x1E);
    virtual int readSensorState();

    virtual void setResolution(RESOLUTION resolution);
    virtual RESOLUTION getResolution();
    virtual void setOutputDataRate(OUTPUT_DATA_RATE outputDataRate);
    virtual OUTPUT_DATA_RATE getOutputDataRate();
    virtual void setSystemMode(SYSTEM_MODE systemMode);
    virtual SYSTEM_MODE getSystemMode();
    virtual void setLPF(LOW_PASS_FILTER lpf);
    virtual LOW_PASS_FILTER getLPF();
    virtual void setOffsetCancellation(OFFSET_CANCELLATION off_canc);
    virtual OFFSET_CANCELLATION getOffsetCancellation();
    virtual float getMagX();
    virtual float getMagY();
    virtual float getMagZ();
    virtual double getAzimuth();
    virtual double getElevation();

    virtual void displayPositionalData(int iterations = 600, int delay_us = 10);
    virtual void storePositionalDataInCSV(int iterations = 500);
    virtual ~LSM303AGR_MAG();
};

#endif /* LSM303AGR_MAG_H_ */