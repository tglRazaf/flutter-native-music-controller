import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_audio_controller/native_audio_controller_method_channel.dart';

void main() {
  MethodChannelNativeAudioController platform = MethodChannelNativeAudioController();
  const MethodChannel channel = MethodChannel('native_audio_controller');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
