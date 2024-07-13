
import 'dart:io';

import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //ScreenRecorder? screenRecorder;
  EdScreenRecorder? screenRecorder;
  Map<String, dynamic> _response = {};

  @override
  void initState() {
    super.initState();
    screenRecorder = EdScreenRecorder();
  }

  Future<void> startRecord({required String fileName}) async {
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;
    var response = await screenRecorder?.startRecordScreen(
      fileName: fileName,
      // `dirPathToSave` Optional. It will save the video there when you give the file path with whatever you want.
      //If you leave it blank, the Android operating system will save it to the gallery.
      //dirPathToSave: tempPath,
      audioEnable: false, width: 350, height: 350,
    );


    setState(() {
      _response = response;
    });
  }

  Future<void> stopRecord() async {
    var response = await screenRecorder?.stopRecord();
    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ed Screen Recorded'),
      ),
    );
  }
}
