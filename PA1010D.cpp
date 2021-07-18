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
 * 
 * The NMEAParser.h file and its implementations are subject to the MIT License.
 * Please see the NMEAParser.h file included for MIT licence details.
 * 
 * NMEAParser can be found here:
 * https://github.com/VisualGPS/NMEAParser
 */
#include "PA1010D.h"

#define BUFFER_SIZE 0xFF
#define END_OF_MESSAGE 0xDA     // <CR> <LF> in ASCII

void PA1010D::OnError(CNMEAParserData::ERROR_E nError, char *pCmd)
{
    printf("Error for Cmd: %s, Number: %d\n", pCmd, nError);
}


PA1010D::PA1010D(std::string sentenceFormat, 
    unsigned int I2CBus, unsigned int I2CAddress = 0x10) :
    sentenceFormat(sentenceFormat), I2CDevice(I2CBus, I2CAddress) 
{
    // Initialize the buffer to store the byte info from the GPS
    this->buffer = new unsigned char[BUFFER_SIZE];

    // Change format to GPGGA
    this->sendCommand("$PMTK353,1,0,0,0,0*2A, $GNGGA"); // TODO: Undo hardcode
}

int PA1010D::sendCommand(std::string cmd)
{
    int i;

    // If the command start is valid, send the command
    // TODO: Make more robust to bad input
    if(cmd.find("$PMTK353") != std::string::npos)
    {
        for(i = 0; i < cmd.size(); i++)
        {
            this->write(cmd[i]);
        }
    }
    else
    {
        perror("Not a valid MTK NMEA Command.");
        return 1;
    }

    return 0;
}

int PA1010D::readSensorState()
{
    // Take in the full buffer for processing
    this->buffer = this->readRegisters(BUFFER_SIZE, 0x00);
}

CNMEAParserData::ERROR_E PA1010D::ProcessRxCommand(
    char *pCmd, char *pData)
{
    // Call base class to process the command
    CNMEAParser::ProcessRxCommand(pCmd, pData);

    printf("Cmd: %s\nData: %s\n", pCmd, pData);

    
		// Check if this is the GPGGA command. If it is, then display some data
		if (strstr(pCmd, "GPGGA") != NULL) {
			CNMEAParserData::GGA_DATA_T ggaData;
			if (GetGPGGA(ggaData) == CNMEAParserData::ERROR_OK) {
				printf("GPGGA Parsed!\n");
				printf("   Time:                %02d:%02d:%02d\n", 
                    ggaData.m_nHour, ggaData.m_nMinute, ggaData.m_nSecond);
				printf("   Latitude:            %f\n", ggaData.m_dLatitude);
				printf("   Longitude:           %f\n", ggaData.m_dLongitude);
				printf("   Altitude:            %.01fM\n", 
                    ggaData.m_dAltitudeMSL);
				printf("   GPS Quality:         %d\n",
                    ggaData.m_nGPSQuality);
				printf("   Satellites in view:  %d\n", ggaData.m_nSatsInView);
				printf("   HDOP:                %.02f\n", ggaData.m_dHDOP);
				printf("   Differential ID:     %d\n",
                    ggaData.m_nDifferentialID);
				printf("   Differential age:    %f\n",
                    ggaData.m_dDifferentialAge);
				printf("   Geoidal Separation:  %f\n", ggaData.m_dGeoidalSep);
				printf("   Vertical Speed:      %.02f\n", ggaData.m_dVertSpeed);
			}
		}

    return CNMEAParserData::ERROR_OK;
}


PA1010D::~PA1010D() {}