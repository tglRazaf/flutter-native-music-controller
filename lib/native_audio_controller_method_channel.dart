import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'native_audio_controller_platform_interface.dart';

/// An implementation of [NativeAudioControllerPlatform] that uses method channels.
class MethodChannelNativeAudioController extends NativeAudioControllerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_audio_controller');

  @override
  Future<String?> pauseAudio() async {
    final res = await methodChannel.invokeMethod<String>('pauseAudio');
    return res;
  }

  @override
  Future<String?> resumeAudio() async {
    final res = await methodChannel.invokeMethod<String>('resumeAudio');
    return res;
  }
}
