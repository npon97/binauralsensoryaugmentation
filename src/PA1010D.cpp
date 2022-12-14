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
#define END_OF_MESSAGE 0xDA // <CR> <LF> in ASCII

void PA1010D::OnError(CNMEAParserData::ERROR_E nError, char *pCmd)
{
    printf("Error for Cmd: %s, Number: %d\n", pCmd, nError);
}

PA1010D::PA1010D(std::string sentenceFormat,
                 unsigned int I2CBus, unsigned int I2CAddress) : sentenceFormat(sentenceFormat), I2CDevice(I2CBus, I2CAddress)
{
    int i;

    // Initialize the buffer to store the byte info from the GPS
    this->buffer = new char[BUFFER_SIZE];

    // Set the command settings
    this->gp_enabled = GP_DISABLE;
    this->gl_enabled = GL_DISABLE;
    this->ga_enabled = GA_ENABLE;
    this->be_enabled = BE_DISABLE;

    this->compileAndSendPMTK353Command();
}

/**
 * @return: 0 on command send success and 1 on command send failure
 * 
 */
int PA1010D::compileAndSendPMTK353Command()
{
    int i;
    std::string cmd = "$PMTK353,";
    char chksum[2]; // The checksum is two bytes long

    // Compile the string by stringifying the x_enabled properties
    cmd += std::to_string(this->gp_enabled) + ",";
    cmd += std::to_string(this->gl_enabled) + ",";
    cmd += std::to_string(this->ga_enabled) + ",";
    cmd += "0,";                                   // GALILEO_FULL_ENABLED is phased out. Keep at 0.
    cmd += std::to_string(this->be_enabled) + "*"; // '*' symbolises data end
    try
    { // Fail if the checksum is not calculated due to bad input
        sprintf(chksum, "%X", this->getChecksum(cmd));
        cmd += chksum; // Checksum of data field
    }
    catch (const std::invalid_argument &e)
    {
        perror(e.what());
        return 1;
    }
    cmd += END_OF_MESSAGE;

    std::cout << "Sending command: " << cmd << std::endl;

    for (i = 0; i < cmd.size(); i++)
    {
        this->write(cmd[i]);
    }

    return 0;
}

unsigned short PA1010D::getChecksum(std::string cmd)
{
    int i;
    unsigned short checksum; // 2 bytes in size

    // Check if the message starts with a preamble
    if (cmd[0] != '$' && cmd[cmd.length() - 1] != '*')
    {
        throw std::invalid_argument("Error: Invalid PTMK353 command.");
    }

    checksum = 0;
    for (i = 1; i < cmd.length() - 1; i++)
    {
        checksum ^= cmd[i];
    }

    return checksum;
}

void PA1010D::displayGGAData()
{
    printf("GGA Data Parsed!\n");
    printf("   Time:                %02d:%02d:%02d\n",
           this->ggaData.m_nHour, this->ggaData.m_nMinute,
           this->ggaData.m_nSecond);
    printf("   Latitude:            %f\n",
           this->ggaData.m_dLatitude);
    printf("   Longitude:           %f\n",
           this->ggaData.m_dLongitude);
    printf("   Altitude:            %.01fM\n",
           this->ggaData.m_dAltitudeMSL);
    printf("   GPS Quality:         %d\n",
           this->ggaData.m_nGPSQuality);
    printf("   Satellites in view:  %d\n",
           this->ggaData.m_nSatsInView);
    printf("   HDOP:                %.02f\n",
           this->ggaData.m_dHDOP);
    printf("   Differential ID:     %d\n",
           this->ggaData.m_nDifferentialID);
    printf("   Differential age:    %f\n",
           this->ggaData.m_dDifferentialAge);
    printf("   Geoidal Separation:  %f\n",
           this->ggaData.m_dGeoidalSep);
    printf("   Vertical Speed:      %.02f\n",
           this->ggaData.m_dVertSpeed);
}

void PA1010D::displayGSVData()
{
    int i;

    printf("GSV Data Parsed!\n");
    printf("   Number of messages:            %d\n",
           this->gsvData.nTotalNumberOfSentences);
    printf("   Sentence number:           %d\n",
           this->gsvData.nSentenceNumber);
    printf("   # of satellites in view:            %d\n",
           this->gsvData.nSatsInView);

    printf("   SatInfo:         \n");
    for (i = 0; i < this->gsvData.nSatsInView &&
                i < CNMEAParserData::c_nMaxConstellation;
         i++)
    {
        printf("   Azimuth:             %f\n",
               this->gsvData.SatInfo[i].dAzimuth);
        printf("   Elevation:             %f\n",
               this->gsvData.SatInfo[i].dElevation);
        printf("   PRN:             %f\n",
               this->gsvData.SatInfo[i].nPRN);
        printf("   SNR:             %f\n",
               this->gsvData.SatInfo[i].nSNR);
    }
}

void PA1010D::displayRMCData()
{
    printf("RMC Data Parsed!\n");
    printf("   Time:                %02d:%02d:%02d\n",
           this->rmcData.m_nHour, this->rmcData.m_nMinute,
           this->rmcData.m_nSecond);
    printf("   Fractional Second:            %f\n",
           this->rmcData.m_dSecond);
    printf("   Latitude:            %f\n",
           this->rmcData.m_dLatitude);
    printf("   Longitude:           %f\n",
           this->rmcData.m_dLongitude);
    printf("   Altitude:            %.01fM\n",
           this->rmcData.m_dAltitudeMSL);
    printf("   Status:         %d\n",
           this->rmcData.m_nStatus);
    printf("   Speed (knots):  %d\n",
           this->rmcData.m_dSpeedKnots);
    printf("   Track Angle:                %.02f\n",
           this->rmcData.m_dTrackAngle);
    printf("   Day:     %d\n",
           this->rmcData.m_nDay);
    printf("   Month:    %f\n",
           this->rmcData.m_nMonth);
    printf("   Year:  %f\n",
           this->rmcData.m_nYear);
    printf("   Magnetic Variation:      %.02f\n",
           this->rmcData.m_dMagneticVariation);
}

/**
 * @description: Displays the selected data at stdout if the data is meaningful.
 * @params: Number of iterations to display the data
 *          The delay in microseconds between iterations
 */
void PA1010D::displaySentenceData(int iterations, int delay_us)
{
    int i;

    for (i = 0; i < iterations; i++)
    {
        readSensorState();
        fflush(stdout);

        // Check if this is the command. If it is, then display some data
        if (GetGAGGA(this->ggaData) != CNMEAParserData::ERROR_OK)
        {
            perror("Error: GGA Sentence parsing was unsuccessful.");
        }
        else if (this->ggaData.m_nSatsInView > 0)
        {
            displayGGAData();
        }
        if (GetGAGSV(this->gsvData) != CNMEAParserData::ERROR_OK)
        {
            perror("Error: GSV Sentence parsing was unsuccessful.");
        }
        else if (this->gsvData.nSatsInView > 0)
        {
            displayGSVData();
        }
        if (GetGARMC(this->rmcData) != CNMEAParserData::ERROR_OK)
        {
            perror("Error: RMC Sentence parsing was unsuccessful.");
        }
        else if (this->rmcData.m_nStatus == CNMEAParserData::RMC_STATUS_ACTIVE)
        {
            displayRMCData();
        }

        usleep(delay_us);
    }
}

int PA1010D::readSensorState()
{
    // Take in the full buffer for processing
    this->buffer = reinterpret_cast<char *>(
        this->readRegisters(BUFFER_SIZE, 0x00));

    this->ProcessNMEABuffer(this->buffer, BUFFER_SIZE);

    return 0;
}

/**
 * @params: Two character arrays. The first for the command and the second for 
 * the data.
 * @returns: An error type to specify a successful or failed parsing.
 * @info: Is redefined here but called within the ProcessNMEABuffer() method.
 * */
CNMEAParserData::ERROR_E PA1010D::ProcessRxCommand(
    char *pCmd, char *pData)
{
    // Call base class to process the command
    printf("START ProcessRxCommand\n");
    CNMEAParser::ProcessRxCommand(pCmd, pData);
    printf("END ProcessRxCommand\n");

    return CNMEAParserData::ERROR_OK;
}

PA1010D::~PA1010D() {}