// PortAudio C bindings 
// https://files.portaudio.com/docs/v19-doxydocs/portaudio_8h.html

module portaudio.portaudiobind;



extern (C) {
    alias PaStreamCallback = PaStreamCallbackResult function(
        const(void)* input,
        void* output,
        ulong frameCount,
        const(PaStreamCallbackTimeInfo)* timeInfo,
        PaStreamCallbackFlags statusFlags,
        void* userData);
    PaError Pa_OpenDefaultStream(
        PaStream** stream,
        int numInputChannels,
        int numOutputChannels,
        PaSampleFormat sampleFormat,  // Changé de `uint` à `PaSampleFormat`
        double sampleRate,
        ulong framesPerBuffer,
        PaStreamCallback streamCallback, // <-- FIXED THIS LINE
        // PaStreamCallback* streamCallback,
        void* userData);
}
@trusted 
extern (C) {

    enum PaStreamCallbackResult : int {// 763  portaudio.h
        paContinue = 0,   // Continue processing
        paComplete = 1,   // Stream processing is complete
        paAbort = 2       // Abort stream processing
    }
    
    enum : ulong{ // 489 typedef unsigned long PaSampleFormat;
        paFloat32 = 0x00000001,
        paInt32 = 0x00000002,
        paInt24 = 0x00000004,
        paInt16 = 0x00000008,// 492 #define paInt16 ((PaSampleFormat) 0x00000008)
        paInt8 = 0x00000010,
        paUInt8 = 0x00000020,
        paCustomFormat = 0x00010000,
        paNonInterleaved = 0x80000000
    }

    enum PaError { //122 typedef int PaError;  typedef enum PaErrorCode...
        paNoError = 0,
        paNotInitialized = -10000,
        // ... 
    }
    alias PaStreamCallbackFlags = ulong;//typedef unsigned long PaStreamCallbackFlags;
    alias PaSampleFormat = ulong;//typedef unsigned long PaSampleFormat;
    struct PaStream; // Opaque struct for PaStream*
    struct PaStreamCallbackTimeInfo; // Placeholder mieux que 'alias PaStreamCallbackTimeInfo = void;

    PaError Pa_Initialize();
    PaError Pa_Terminate();

    
    PaError Pa_StartStream(PaStream* stream);
    PaError Pa_StopStream(PaStream* stream);
    PaError Pa_CloseStream(PaStream* stream);
    const(char)* Pa_GetErrorText(PaError errorCode);
}