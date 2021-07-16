/*
 * PA1010D.cpp  Created on: 16 July 2021
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
 */
#include "PA1010D.h"

#define MAX_TOKEN_LENGTH 5
#define BUFFER_SIZE 0xFF


PA1010D::PA1010D(const char* sentenceFormat, 
    unsigned int I2CBus, unsigned int I2CAddress = 0x10) :
    sentenceFormat(sentenceFormat), I2CDevice(I2CBus, I2CAddress) 
{
    this->buffer = new unsigned char[BUFFER_SIZE];
    this->latitude = 0.0f;
    this->longitude = 0.0f;

}

int PA1010D::readSensorState()
{
    int i, j;
    unsigned char* token;

    // Take in the full buffer for processing
    this->buffer = this->readRegisters(BUFFER_SIZE, 0x00);

    // Process the buffer
    // Find the sentence
    for(i = 0; i < BUFFER_SIZE; i++)
    {
        if(this->buffer[i] != '$')
            continue;

        for(j = 0; j < MAX_TOKEN_LENGTH; j++)
        {
            if()
        }
    }
}


PA1010D::~PA1010D() {}