/*
 * PA1010D.h  Created on: 16 July 2021
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
 * The NMEAParser.h file and its implementations are subject to the MIT License.
 * Please see the NMEAParser.h file included for MIT licence details.
 * 
 * NMEAParser can be found here:
 * https://github.com/VisualGPS/NMEAParser
 */

#ifndef PA1010D_H_
#define PA1010D_H_

#include "I2CDevice.h"
#include "NMEAParser.h"
#include <stdint.h>
#include <string.h>


class PA1010D : protected I2CDevice, public CNMEAParser
{
private:
    unsigned int I2CBus, I2CAddress;
    char* sentenceFormat;
    char *buffer;
    CNMEAParserData::GGA_DATA_T ggaData;

    virtual void OnError(CNMEAParserData::ERROR_E nError, char *pCmd);

public:
    PA1010D(char* sentenceFormat, 
        unsigned int I2CBus, unsigned int I2CAddress = 0x10);
    virtual int readSensorState();
    virtual int sendCommand(std::string cmd);

    virtual ~PA1010D();

protected:
    virtual CNMEAParserData::ERROR_E ProcessRxCommand(char *pCmd, char *pData);
};

#endif /* PA1010D_H_ */