import 'package:flutter/material.dart';
import 'package:native_audio_controller/native_audio_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _nativeAudioControllerPlugin = NativeAudioController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Pause or resume Audio plugin writen in kotlin'),
            ),
            ElevatedButton(
              onPressed: () {
                _nativeAudioControllerPlugin.pauseAudio();
              },  
              child: const Text('Pause audio'),
            ),
            ElevatedButton(
              onPressed: () {
                _nativeAudioControllerPlugin.resumeAudio();
              },  
              child: const Text('Resume audio'),
            ),
          ],
        ),
      ),
    );
  }
}
