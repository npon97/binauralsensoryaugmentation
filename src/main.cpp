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

#define SUPERLOOP_uS 100000
#define NUM_DISPLAY_ITERATIONS 100000

/*          FORWARD DECLARATIONS        */
void changeSourcePosition( float *a , LSM303AGR_MAG* magnetometer);
void* load( char *fname, long *bufsize );

/*      MAIN FUNCTION       */
int main(int argc, char* argv[])
{
    int i = 0;
    LSM303AGR_MAG* magnetometer;
    PA1010D* gps;
    /* current position and where to walk to... start just 1m ahead */
    float curr[3] = {0.,0.,0.};
    float targ[3] = {0.,0.,0.};
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


    // Display the sensor data one after the other
    // for(i = 0; i < NUM_DISPLAY_ITERATIONS; i++)
    // {
    //     magnetometer->displayPositionalData(1);
    //     //gps->displaySentenceData(1);

    //     usleep(SUPERLOOP_uS);
    // }

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

    /* listener at origin, facing down -z (ears at 1.5m height) */
    alListener3f( AL_POSITION, 0., 1.5, 0. );
    alListener3f( AL_VELOCITY, 0., 0., 0. ); /* the listener is stationary */
    ALfloat orient[6] = { /*fwd:*/ 0., 0., -1., /*up:*/ 0., 1., 0. };
    alListenerfv( AL_ORIENTATION, orient );

    /* this will be the source of sound... */
    ALuint source;
    alGenSources( 1, &source );
    alSourcef( source, AL_PITCH, 1. );
    alSourcef( source, AL_GAIN, 1. );
    alSource3f( source, AL_POSITION, curr[0],curr[1],curr[2] );
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
    float vel = 0.8 * dt;
    float closeEnough = 0.05;

    /** BEGIN! **/
    alSourcePlay( source );

    fflush( stderr ); /* in case OpenAL reported an error earlier */


    /* loop until 'q' key pressed */
    for(;;){
        float dx = targ[0]-curr[0];
        float dy = targ[1]-curr[1];
        float dz = targ[2]-curr[2];
        float dist = sqrtf( dx*dx + dy*dy + dz*dz );
        if( dist < closeEnough ) changeSourcePosition(targ, magnetometer);
        else{
            float toVel = vel/dist;
            float v[3] = {dx*toVel, dy*toVel, dz*toVel};
            curr[0]+= v[0];
            curr[1]+= v[1];
            curr[2]+= v[2];

            alSource3f( source, AL_POSITION, curr[0],curr[1],curr[2] );
            alSource3f( source, AL_VELOCITY, v[0],v[1],v[2] );
            usleep( /*(int)(1e6*dt)*/ SUPERLOOP_uS );
        }
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
void changeSourcePosition( float *a , LSM303AGR_MAG* magnetometer)
{
    // Work on the unit circle for changing the sound source based on the azimuth
    // The x and z axes are parallel to the ground.
    float theta; // For changing the azimuth into a cartesian point on a unit circle.

    theta = magnetometer->getAzimuth();
    a[0] = sin(theta * M_PI/180);
    a[2] = cos(theta * M_PI/180);
    printf("Magnetomer reads: ");
    magnetometer->displayPositionalData(1, 1); // Number of iterations and delay (ms) 
    printf("Changing sound source position to: %.1f,%.1f,%.1f\n",a[0],a[1],a[2]);
}