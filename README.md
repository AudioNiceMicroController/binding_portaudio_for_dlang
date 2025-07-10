# Dub binding portaudio for D

D bindings for the C library [PortAudio](http://www.portaudio.com/), permettant de générer ou traiter de l'audio en temps réel avec le langage D.

---

## 🚀 Installation

Create a new D project with `dub`:


```bash
dub init test_portaudio
cd test_portaudio
dub add portaudio-d
```

## Make sure PortAudio is installed on your system :

### macOS :
```bash
brew install portaudio
```

### Linux (Debian/Ubuntu) :
```bash
sudo apt install libportaudio2 libportaudio-dev
```

### Windows :
Download and build PortAudio manually, or use MSYS2 or [vcpkg](https://vcpkg.io)..

## 🧪 Minimal Example

```d 
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
```

### Compile and run with:
`dub run`
or
`dub`


## 📦 Package Info


Package name: portaudio-d  
License: MIT  
Author: [AudioNiceMicroController](https://github.com/AudioNiceMicroController)  
Repository: [GitHub](https://github.com/AudioNiceMicroController/binding_portaudio_for_dlang)


## ✅ Status

✔️ Basic bindings working  
🛠️ Ready for extensions (microphone input, streaming, etc.)

## You can test the example
`bash
dub run -c example440hz
`
