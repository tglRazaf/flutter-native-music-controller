import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_audio_controller_platform_interface.dart';

/// An implementation of [NativeAudioControllerPlatform] that uses method channels.
class MethodChannelNativeAudioController extends NativeAudioControllerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_audio_controller');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
