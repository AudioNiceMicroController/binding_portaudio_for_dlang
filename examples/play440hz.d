import std.stdio;
import portaudio.stream;

void main() {
    try {
        auto stream = Stream(440.0f); // 440 Hz
        writeln("Playing a 440 Hz sine wave...");
        stream.play(500); // 500 ms
        writeln("Finished.");
    } catch (Throwable e) {
        stderr.writeln("Erreur : ", e.msg);
    }
}
