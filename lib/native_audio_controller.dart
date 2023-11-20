
import 'native_audio_controller_platform_interface.dart';

class NativeAudioController {

  Future<String?> pauseAudio() async {
    return NativeAudioControllerPlatform.instance.pauseAudio();
  }

  Future<String?> resumeAudio() async {
    return NativeAudioControllerPlatform.instance.resumeAudio();
  }
}
