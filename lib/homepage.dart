
import 'dart:io';

import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/material.dart';

import '../../../Users/Kneelon/AppData/Local/Pub/Cache/hosted/pub.dev/ed_screen_recorder-0.0.15/lib/src/ed_screen_recorder/ed_screen_recorder_plugin.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final EdScreenRecorder _screenRecorder = EdScreenRecorder();
  bool _isRecording = false;

  Future<void> _startRecording() async {
    try {
      await _screenRecorder.startRecordScreen(
        fileName: 'recording',
        dirPathToSave: '/your/directory/path',
        addTimeCode: true,
        fileOutputFormat: "MPEG_4",
        fileExtension: "mp4",
        videoBitrate: 3000000,
        videoFrame: 30,
        width: 1080,
        height: 1920,
        audioEnable: true,
      );
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print("Error starting screen recording: $e");
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _screenRecorder.stopRecord();
      setState(() {
        _isRecording = false;
      });
    } catch (e) {
      print("Error stopping screen recording: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Recording Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _isRecording ? 'Recording...' : 'Press the button to start recording',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Start Recording'),
            ),
          ],
        ),
      ),
    );
  }
}
