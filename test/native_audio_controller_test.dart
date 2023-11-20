import 'package:flutter_test/flutter_test.dart';
import 'package:native_audio_controller/native_audio_controller.dart';
import 'package:native_audio_controller/native_audio_controller_platform_interface.dart';
import 'package:native_audio_controller/native_audio_controller_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeAudioControllerPlatform
    with MockPlatformInterfaceMixin
    implements NativeAudioControllerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeAudioControllerPlatform initialPlatform = NativeAudioControllerPlatform.instance;

  test('$MethodChannelNativeAudioController is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeAudioController>());
  });

  test('getPlatformVersion', () async {
    NativeAudioController nativeAudioControllerPlugin = NativeAudioController();
    MockNativeAudioControllerPlatform fakePlatform = MockNativeAudioControllerPlatform();
    NativeAudioControllerPlatform.instance = fakePlatform;

    expect(await nativeAudioControllerPlugin.getPlatformVersion(), '42');
  });
}
