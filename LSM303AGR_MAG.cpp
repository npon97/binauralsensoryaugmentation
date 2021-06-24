/*
 * LSM303AGR_MAG.cpp  Created on: 24 June 2021
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
 */

#include "LSM303AGR_MAG.h"
#include <iostream>

#define OFFSET_X_REG_L 0x45 // X hard-iron offset least significant bit (LSB). 
#define OFFSET_X_REG_H 0x46 // X hard-iron offset most significant bit (MSB).
#define OFFSET_Y_REG_L 0x47 // Y hard-iron offset LSB. 
#define OFFSET_Y_REG_H 0x48 // Y hard-iron offset MSB.
#define OFFSET_Z_REG_L 0x49 // Z hard-iron offset LSB. 
#define OFFSET_Z_REG_H 0x4A // Z hard-iron offset MSB.
#define WHO_AM_I       0x4F // [READ ONLY] Identification register. Value: 40h 
#define CFG_REG_A      0x60 // Soft reset, power mode, ODR and mode select.
#define CFG_REG_B      0x61 // Offset interrupt, set pulse frequency, offset 
                            //  cancellation enable and low-pass filter enable.
#define CFG_REG_C      0x62 // Magnetometer interrupt, I2C disable, bad data
                            //  update, data inversion, self test and 
                            //  DRDY pin output enable.
#define INT_CTRL_REG   0x63 // Interrupt control for interrupt recognition.
#define INT_SOURCE_REG 0x64 // Positive-negative interrupt values and event bit
#define INT_THS_L_REG  0x65 // LSB threshold value register for interrupt
#define INT_THS_H_REG  0x66 // MSB threshold value register for interrupt
#define STATUS_REG     0x67 // [READ ONLY] device status
#define OUTX_L_REG     0x68 // LSB X axis raw magnetic data
#define OUTX_H_REG     0x69 // MSB X axis raw magnetic data
#define OUTY_L_REG     0x6A // LSB Y axis raw magnetic data
#define OUTY_H_REG     0x6B // MSB Y axis raw magnetic data
#define OUTZ_L_REG     0x6C // LSB Z axis raw magnetic data
#define OUTZ_H_REG     0x6D // MSB Z axis raw magnetic data

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
u_int16_t LSM303AGR_MAG::combineRegisters(u_int8_t msb, u_int8_t lsb)
{
    //shift the MSB left by 8 bits and OR with LSB
    return ((u_int16_t)msb << 8) | (u_int16_t)lsb;
}

LSM303AGR_MAG::RESOLUTION LSM303AGR_MAG getResolution()
{
    return this->resolution;
}
LSM303AGR_MAG::OUTPUT_DATA_RATE LSM303AGR_MAG::getOutputDataRate()
{
    return this->outputDataRate;
}