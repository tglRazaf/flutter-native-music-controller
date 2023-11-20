
import 'native_audio_controller_platform_interface.dart';

class NativeAudioController {
  Future<String?> getPlatformVersion() {
    return NativeAudioControllerPlatform.instance.getPlatformVersion();
  }
}
