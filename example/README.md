# native_audio_controller

A Flutter plugin to handle pause/play for running music in background from another app

## Supported Platforms

- Android: Fully supported
- iOS: Under development (not yet implemented)

### Usage 
```dart
import 'package:native_audio_controller/native_audio_controller.dart';

final _nativeAudioControllerPlugin = NativeAudioController();

// Pause a background music from other app
_nativeAudioControllerPlugin.pauseAudio();

// Resume the music
_nativeAudioControllerPlugin.resumeAudio();   
```
## Setup, permissions

### Android
```xml
<uses-permission android:name="android.permission.BROADCAST_STICKY" />
```