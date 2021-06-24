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

#define OFFSET_X_REG_L 0x45
#define OFFSET_X_REG_H 0x46
#define OFFSET_Y_REG_L 0x47
#define OFFSET_Y_REG_H 0x48
#define OFFSET_Z_REG_L 0x49
#define OFFSET_Z_REG_H 0x4A
#define WHO_AM_I       0x4F
#define CFG_REG_A      0x60
#define CFG_REG_B      0x61
#define CFG_REG_C      0x62
#define INT_CTRL_REG   0x63
#define INT_SOURCE_REG 0x64
#define INT_THS_L_REG  0x65 // Threashold value register for interrupt
#define INT_THS_H_REG  0x66
#define STATUS_REG     0x67
#define OUTX_L_REG     0x68
#define OUTX_H_REG     0x69
#define OUTY_L_REG     0x6A
#define OUTY_H_REG     0x6B
#define OUTZ_L_REG     0x6C
#define OUTZ_H_REG     0x6D



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
u_int16_t LSM303AGR_MAG::combineRegisters(unsigned char msb, unsigned char lsb){
   //shift the MSB left by 8 bits and OR with LSB
   return ((u_int16_t)msb<<8)|(u_int16_t)lsb;
}
