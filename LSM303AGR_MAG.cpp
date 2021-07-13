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

#include "LSM303AGR_MAG.h"
#include <iostream>
#include <iomanip>
#include <unistd.h>
#include <math.h>

/* Register Mapping */
#define OFFSET_X_REG_L 0x45 // X hard-iron offset least significant bit (LSB).
#define OFFSET_X_REG_H 0x46 // X hard-iron offset most significant bit (MSB).
#define OFFSET_Y_REG_L 0x47 // Y hard-iron offset LSB.
#define OFFSET_Y_REG_H 0x48 // Y hard-iron offset MSB.
#define OFFSET_Z_REG_L 0x49 // Z hard-iron offset LSB.
#define OFFSET_Z_REG_H 0x4A // Z hard-iron offset MSB.
#define WHO_AM_I 0x4F       // [READ ONLY] Identification register. Value: 40h
#define CFG_REG_A 0x60      // Soft reset, power mode, ODR and mode select.
#define CFG_REG_B 0x61      // Offset interrupt, set pulse frequency, offset \
                            //  cancellation enable and low-pass filter enable.
#define CFG_REG_C 0x62      // Magnetometer interrupt, I2C disable, bad data \
                            //  update, data inversion, self test and        \
                            //  DRDY pin output enable.
#define INT_CTRL_REG 0x63   // Interrupt control for interrupt recognition.
#define INT_SOURCE_REG 0x64 // Positive-negative interrupt values and event bit
#define INT_THS_L_REG 0x65  // LSB threshold value register for interrupt
#define INT_THS_H_REG 0x66  // MSB threshold value register for interrupt
#define STATUS_REG 0x67     // [READ ONLY] device status
#define OUTX_L_REG 0x68     // LSB X axis raw magnetic data
#define OUTX_H_REG 0x69     // MSB X axis raw magnetic data
#define OUTY_L_REG 0x6A     // LSB Y axis raw magnetic data
#define OUTY_H_REG 0x6B     // MSB Y axis raw magnetic data
#define OUTZ_L_REG 0x6C     // LSB Z axis raw magnetic data
#define OUTZ_H_REG 0x6D     // MSB Z axis raw magnetic data

/* On the LSM303AGR, registers 40h through 6Fh are dedicated to the magnetometer.
*  There are reserved registers 0x4B through 0x4E and 0x50 through 0x5F which 
*   should not be written to.
*/

#define BUFFER_SIZE           0x70 // Size of buffer / Number of registers
#define BUFFER_HARD_IRON_SIZE 0x06
#define BUFFER_WHO_AM_I_SIZE  0x01
#define BUFFER_CFG_STATUS_DATA_SIZE 0x0E

// Both constants come from the data sheet and NOT from math.h
#define M_FS        49.152f // Magnetic Dynamic Range
#define M_GN        1.5f    // Magnetic Sensitivity

#define DISPLAY_SUPERLOOP_uS  100000 // Debug display superloop delay
#define DISPLAY_COL_WIDTH     11

// Constructor
LSM303AGR_MAG::LSM303AGR_MAG(unsigned int I2CBus, unsigned int I2CAddress)
    : I2CDevice(I2CBus, I2CAddress)
{
    this->I2CAddress = I2CAddress;
    this->I2CBus = I2CBus;
    this->registers = new uint8_t[BUFFER_SIZE];
    this->hard_iron_reg = NULL;
    this->who_am_i_reg  = NULL;
    this->cfg_status_data_reg = NULL;
    this->magX = 0;
    this->magY = 0;
    this->magZ = 0;
    this->azimuth = 0.0f;
    this->elevation = 0.0f;
    this->resolution = LSM303AGR_MAG::HIGH;
    this->outputDataRate = LSM303AGR_MAG::TEN_HERTZ;
    this->systemMode = LSM303AGR_MAG::CONTINUOUS;
    this->updateRegisters();
}

/**
 * Method to combine two 8-bit registers into a single short, which is 16-bits 
 * on the Raspberry Pi. It shifts the MSB 8-bits to the left and then ORs the
 * result with the LSB.
 * @param msb an unsigned character that contains the most significant byte
 * @param lsb an unsigned character that contains the least significant byte
 * 
 * Modified from:
 * https://github.com/derekmolloy/exploringrpi/blob/master/chp08/i2c/cpp/ADXL345.cpp
 */
short LSM303AGR_MAG::combineRegisters(unsigned char msb, unsigned char lsb)
{
    //shift the MSB left by 8 bits and OR with LSB
    return ((short)msb << 8) | (short)lsb;
}

/**
 * Method that reads in the sensor state and sets the LSM303AGR attributes
 * @return an int that is -1 for read failure and 0 for read success.
 */ 
int LSM303AGR_MAG::readSensorState()
{
    int i;

    // Read in the register buffers that are allows to be read from
    try
    {    
        this->hard_iron_reg = this->readRegisters(
            BUFFER_HARD_IRON_SIZE, OFFSET_X_REG_L);
        this->who_am_i_reg = this->readRegisters(
            BUFFER_WHO_AM_I_SIZE, WHO_AM_I);
        this->cfg_status_data_reg = this->readRegisters(
            BUFFER_CFG_STATUS_DATA_SIZE, CFG_REG_A);
    }
    catch(const char * errmsg)
    {
        std::cerr << errmsg << std::endl;
        return -1;
    }

    // Fill the register array with 0s in read forbidden register data and
    //  fill the other registers with the relevant data
    for(i = 0; i < BUFFER_SIZE; i++)
    {
        if((i >= 0) && (i < OFFSET_X_REG_L))
        {
            this->registers[i] = 0; 
        }
        else if((i >= OFFSET_X_REG_L) && (i <= OFFSET_Z_REG_H))
        {
            this->registers[i] = this->hard_iron_reg[i - OFFSET_X_REG_L];
        }
        else if((i > OFFSET_Z_REG_H) && (i < WHO_AM_I))
        {
            this->registers[i] = 0;
        }
        else if(i == WHO_AM_I)
        {
            this->registers[i] = this->who_am_i_reg[i - WHO_AM_I];
        }
        else if((i > WHO_AM_I) && (i < CFG_REG_A))
        {
            this->registers[i] = 0;
        }
        else if((i >= CFG_REG_A) && (i <= OUTZ_H_REG))
        {
            this->registers[i] = this->cfg_status_data_reg[i - CFG_REG_A];
        }
        else if((i > OUTZ_H_REG) && (i < BUFFER_SIZE))
        {
            this->registers[i] = 0;
        }
        else
        {
            perror("LSM303AGR_MAG: [ERROR] Incorrect register index");
            return -1;
        }
    }

    // Throw an error if the device ID doesnt match
    if(*(this->registers+WHO_AM_I)!=0x40)
    {
        perror("LSM303AGR Magnetometer: Failure Condition - Sensor ID invalid");
        return -1;
    }

    // Combine the MSB and LSB from the raw magnetic data and multiply by the
    //  sensitivity to gain the real magnetic measurement
    this->magX = (float) this->combineRegisters(*(registers + OUTX_H_REG),
        *(registers + OUTX_L_REG)) * M_GN; 
    this->magY = (float) this->combineRegisters(*(registers + OUTY_H_REG),
        *(registers + OUTY_L_REG)) * M_GN;
    this->magZ = (float) this->combineRegisters(*(registers + OUTZ_H_REG),
        *(registers + OUTZ_L_REG)) * M_GN;

    // Calculate the resulting azimuth which depends on the 
    //  previous magnetic data
    this->calculateAzimuth();

    // Retrieve only the bits that are needed by using bitwise & and
    //  shifting the value back. Notice how the LP bit on the data sheet
    //  overlaps with the only HIGH binary bit that is written here.
    this->resolution = (LSM303AGR_MAG::RESOLUTION) 
        (((*(registers + CFG_REG_A)) & 0b00010000) >> 4);
    
    this->outputDataRate = (LSM303AGR_MAG::OUTPUT_DATA_RATE)
        (((*(registers + CFG_REG_A)) & 0b00001100) >> 2);

    this->systemMode = (LSM303AGR_MAG::SYSTEM_MODE)
        (((*(registers + CFG_REG_A)) & 0b00000011) );

    return 0;
}

/**
 * Method to calculate the Azimuth angles using the raw magnetic
 * data.
 */
void LSM303AGR_MAG::calculateAzimuth()
{
    // Account for older C++ versions throwing a domain error
    try
    {
        this->azimuth = atan2((double) this->magY, (double) this->magX) * 
            (180/M_PI);
    }
    catch(const std::exception& e)
    {
        std::cerr << "Caught: " <<  e.what() << '\n';
        std::cerr << "Type: " << typeid(e).name() << '\n';
    }
}

/**
 * Updates the device registers to set configuration data and any other bits 
 * that change the devices behvaiour. For example, interrupt control or offset
 * @return an int which is 1 for write failure and 0 for write success.
 */
int LSM303AGR_MAG::updateRegisters()
{
    // Update CFG_REG_A
    uint8_t cfg_reg_a;
    cfg_reg_a = cfg_reg_a | ((this->resolution) << 4);
    cfg_reg_a = cfg_reg_a | ((this->outputDataRate) << 2);
    cfg_reg_a = cfg_reg_a | ((this->systemMode));
    return (this->writeRegister(CFG_REG_A, cfg_reg_a));
}

void LSM303AGR_MAG::setResolution(LSM303AGR_MAG::RESOLUTION resolution)
{
    this->resolution = resolution;
}
LSM303AGR_MAG::RESOLUTION LSM303AGR_MAG::getResolution()
{
    return this->resolution;
}

void LSM303AGR_MAG::setOutputDataRate(
        LSM303AGR_MAG::OUTPUT_DATA_RATE outputDataRate)
{
    this->outputDataRate = outputDataRate;
}
LSM303AGR_MAG::OUTPUT_DATA_RATE LSM303AGR_MAG::getOutputDataRate()
{
    return this->outputDataRate;
}

void LSM303AGR_MAG::setSystemMode(LSM303AGR_MAG::SYSTEM_MODE systemMode)
{
    this->systemMode = systemMode;
}
LSM303AGR_MAG::SYSTEM_MODE LSM303AGR_MAG::getSystemMode()
{
    return this->systemMode;
}

void LSM303AGR_MAG::displayPositionalData(int iterations)
{
    int i;
    for(i = 0; i < iterations; i++)
    {
        this->readSensorState();
        std::cout << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << "Azimuth: " << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << this->azimuth << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << "Elevation: " << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << this->elevation << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << "Magnetic X: " << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << this->magX << std::setw(DISPLAY_COL_WIDTH) << std::left<< std::setfill(' ')
         << "Magnetic Y: " << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << this->magY << std::setw(DISPLAY_COL_WIDTH) << std::left << std::setfill(' ')
         << "Magnetic Z: " << this->magZ << "\r" << std::flush;
        //this->debugDumpRegisters(BUFFER_SIZE);
        usleep(DISPLAY_SUPERLOOP_uS);
    }
}

LSM303AGR_MAG::~LSM303AGR_MAG() {}