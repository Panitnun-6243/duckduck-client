import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class UploadMp3Button extends StatefulWidget {
  @override
  _UploadMp3ButtonState createState() => _UploadMp3ButtonState();
}

class _UploadMp3ButtonState extends State<UploadMp3Button> {
  File? _pickedFile;

  void _pickFile() async {
    // Use file_picker to pick the file
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result != null) {
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });
      // You can now use the _pickedFile to upload
      // uploadFileToGCS(_pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        backgroundColor: DuckDuckColors.frostWhite,
        padding: const EdgeInsets.all(10),
      ),
      onPressed: _pickFile,
      child: SizedBox(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.drive_folder_upload_outlined,
              color: DuckDuckColors.skyBlue,
              size: 24,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Upload',
              style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: DuckDuckColors.skyBlue),
            ),
          ],
        ),
      ),
    );
  }
}
