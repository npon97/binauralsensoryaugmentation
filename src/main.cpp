#include "I2CDevice.h"
#include "PA1010D.h"
#include "LSM303AGR_MAG.h"
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>  /* for usleep() */
#include <math.h>    /* for sqrtf(), and trig functions */
#include <time.h>    /* for time(), to seed srand() */
/* OpenAL headers */
#include <AL/al.h>
#include <AL/alc.h>
#include <AL/alext.h>

#define SUPERLOOP_uS 1000000
#define NUM_DISPLAY_ITERATIONS 30

/*          FORWARD DECLARATIONS        */
void changeListenerPose( float *a , LSM303AGR_MAG* magnetometer);
void* load( char *fname, long *bufsize );

/*      MAIN FUNCTION       */
int main(int argc, char* argv[])
{
    int i = 0;
    LSM303AGR_MAG* magnetometer;
    PA1010D* gps;
    ALfloat sound_position[3] = {1.,0.,0.};
    ALfloat listener_position[3] = {0., 0., 0.};
    /* initialize OpenAL context, asking for 44.1kHz to match HRIR data */
    ALCint contextAttr[] = {ALC_FREQUENCY,44100,0};
    ALCdevice* device = alcOpenDevice( NULL );
    ALCcontext* context;
    char key; // To exit the superloop

    // Create an accelerometer object
    try
    {
        magnetometer = new LSM303AGR_MAG(1, 0x1E);
        gps = new PA1010D("GAGSV", 1, 0x10);
    }
    catch(int i)
    {
        perror("\nAborting: Magnetometer Object could not be created.\n");
        return i;
    }


    //Display the sensor data one after the other
    for(i = 0; i < NUM_DISPLAY_ITERATIONS; i++)
    {
        magnetometer->displayPositionalData(1);
        //gps->displaySentenceData(1);

        usleep(SUPERLOOP_uS);
    }

    /** START of BINAURAL IMPLEMENTATION
    *
    * Code directly modified from:
    * https://cranialburnout.blogspot.com/2012/08/openal-soft-demonstration-of-binaural.html
    * 
    * @author: Tony Tavener
    */ 

    // Setup the device
    if(device)
    {
        context = alcCreateContext( device, contextAttr );
        alcMakeContextCurrent( context );
    }

    /* Listener at origin, facing down -z (ears at 1.5m height) */
    alListener3f( AL_POSITION, 0., 1.5, 0. );
    alListener3f( AL_VELOCITY, 0., 0., 0. ); /* The listener is stationary, 
                                                but can move */
    ALfloat orient[6] = { /*at:*/ 0., 0., -1., /*up:*/ 0., 1., 0. };
    alListenerfv( AL_ORIENTATION, orient );

    /* This is the waypoint / source of the sound. */
    ALuint source;
    alGenSources( 1, &source );
    alSourcef( source, AL_PITCH, 1. );
    alSourcef( source, AL_GAIN, 1. );
    alSource3f( source, AL_POSITION, 
        sound_position[0], sound_position[1], sound_position[2] );
    alSource3f( source, AL_VELOCITY, 0.,0.,0. );
    alSourcei( source, AL_LOOPING, AL_TRUE );

    /* allocate an OpenAL buffer and fill it with monaural sample data */
    ALuint buffer;
    alGenBuffers( 1, &buffer );
    {
        long dataSize;
        // TODO: SEGV fault on failure to find file. Implement work around or error.
        const ALvoid* data = load( "/home/pi/Projects/mece2021/footsteps.raw", 
            &dataSize); 
        /* for simplicity, assume raw file is signed-16b at 44.1kHz */
        alBufferData( buffer, AL_FORMAT_MONO16, data, dataSize, 44100 );
        free( (void*)data );
    }
    alSourcei( source, AL_BUFFER, buffer );

    /* state initializations for the upcoming loop */
    srand( (int)time(NULL) );
    float dt = 1./60.;

    /** BEGIN! **/
    alSourcePlay( source );

    fflush( stderr ); /* in case OpenAL reported an error earlier */


    /* Loop forever */
    for(;;){
        changeListenerPose(orient, magnetometer);
        alListener3f( AL_POSITION, 
            listener_position[0], listener_position[1], listener_position[2] );
        alListenerfv( AL_ORIENTATION, orient);
        printf("Sound position is: %.1f,%.1f,%.1f\n",
            sound_position[0],
            sound_position[1],
            sound_position[2]);
        usleep( /*(int)(1e6*dt)*/ SUPERLOOP_uS );
    }

    /* cleanup that should be done when you have a proper exit... ;) */
    context = alcGetCurrentContext();
    alDeleteSources( 1, &source );
    alDeleteBuffers( 1, &buffer );
    alcDestroyContext( context );
    alcCloseDevice( device );

	return 0;
}

/*      HELPER FUNCTIONS        */
/**
* Helper functions directly modified from:
* https://cranialburnout.blogspot.com/2012/08/openal-soft-demonstration-of-binaural.html
* 
* @author: Tony Tavener
*/ 

/* load a file into memory, returning the buffer and
 * setting bufsize to the size-in-bytes */
void* load( char *fname, long *bufsize ){
   FILE* fp = fopen( fname, "rb" );
   fseek( fp, 0L, SEEK_END );
   long len = ftell( fp );
   rewind( fp );
   void *buf = malloc( len );
   fread( buf, 1, len, fp );
   fclose( fp );
   *bufsize = len;
   return buf;
}

/* Displace 'a' +/- in x and z */
void changeListenerPose( float *a , LSM303AGR_MAG* magnetometer)
{
    // Work on the unit circle for changing the sound source based on the azimuth
    // The x and z axes are parallel to the ground.
    float theta; // For changing the azimuth into a cartesian point on a unit circle.

    theta = magnetometer->getAzimuth();
    a[0] = sin(theta * M_PI/180);
    a[2] = cos(theta * M_PI/180);
    printf("Magnetomer reads: ");
    magnetometer->displayPositionalData(1, 1); // Number of iterations and delay (ms) 
    printf("Changing listener orientation to: \n\tAt Vector: %.1f,%.1f,%.1f \
        \n\tUp Vector: %.1f,%.1f,%.1f\n", a[0],a[1],a[2], a[3],a[4],a[5]);
}