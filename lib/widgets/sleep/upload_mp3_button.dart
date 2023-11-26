import 'dart:io';
import 'package:flutter/material.dart';

class UploadMp3Button extends StatefulWidget {
  @override
  _UploadMp3ButtonState createState() => _UploadMp3ButtonState();
}

class _UploadMp3ButtonState extends State<UploadMp3Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('object');
      },
      child: Text('Upload MP3'),
    );
  }
}
