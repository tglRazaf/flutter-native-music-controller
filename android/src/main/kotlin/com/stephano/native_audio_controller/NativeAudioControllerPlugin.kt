package com.stephano.native_audio_controller

import android.content.Context
import android.media.AudioManager
import android.content.Intent
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** NativeAudioControllerPlugin */
class NativeAudioControllerPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context 

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "native_audio_controller")
    channel.setMethodCallHandler(this)
    context = binding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "pauseAudio" -> {
        if(pauseAudio()){
          result.success("audio paused")
        } else {
          result.error("AUDIO_ERROR", "Error pausing audio", null)
        }
      }
      "resumeAudio" -> {
        if(resumeAudio()){
          result.success("audio resumed")
        } else {
          result.error("AUDIO_ERROR", "Error resuming audio", null)
        }
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun pauseAudio(): Boolean {
    val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    val result = audioManager.requestAudioFocus(
      null,
      AudioManager.STREAM_MUSIC,
      AudioManager.AUDIOFOCUS_GAIN_TRANSIENT
    )

    if (result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED) {
      val intent = Intent("com.android.music.musicservicecommand")
      intent.putExtra("command", "pause")
      context.sendBroadcast(intent)
      return true
    } 
    return false
  }

  private fun resumeAudio(): Boolean {
    val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
    val result = audioManager.abandonAudioFocus(null)

    if (result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED) {
      val intent = Intent("com.android.music.musicservicecommand")
      intent.putExtra("command", "play")
      context.sendBroadcast(intent)
      return true
    } 
    return false
  }  
}