import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_audio_controller_method_channel.dart';

abstract class NativeAudioControllerPlatform extends PlatformInterface {
  /// Constructs a NativeAudioControllerPlatform.
  NativeAudioControllerPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeAudioControllerPlatform _instance = MethodChannelNativeAudioController();

  /// The default instance of [NativeAudioControllerPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeAudioController].
  static NativeAudioControllerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeAudioControllerPlatform] when
  /// they register themselves.
  static set instance(NativeAudioControllerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
  
  Future<String?> pauseAudio() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> resumeAudio() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
