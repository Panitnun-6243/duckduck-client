import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

class RgbPicker extends StatelessWidget {
  final TextEditingController textColorController;
  final Color pickerColor;
  final void Function(Color) changeColor;
  const RgbPicker(
      {super.key,
      required this.textColorController,
      required this.pickerColor,
      required this.changeColor});

  @override
  Widget build(BuildContext context) {
    void copyToClipboard(String input) {
      String textToCopy = input.replaceFirst('#', '').toUpperCase();
      if (textToCopy.startsWith('FF') && textToCopy.length == 8) {
        textToCopy = textToCopy.replaceFirst('FF', '');
      }
      Clipboard.setData(ClipboardData(text: '#$textToCopy'));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          ColorPicker(
            enableAlpha: false,
            displayThumbColor: true,
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            pickerAreaHeightPercent: 0.8,
            paletteType: PaletteType.hsl,
            labelTypes: const [
              ColorLabelType.hsl,
            ],
            pickerAreaBorderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            hexInputController: textColorController,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: CupertinoTextField(
              style: TextStyle(
                  fontFamily: GoogleFonts.rubik(
                fontWeight: FontWeight.normal,
              ).fontFamily),
              controller: textColorController,
              prefix: const Padding(
                  padding: EdgeInsets.only(left: 8), child: Icon(Icons.tag)),
              suffix: IconButton(
                icon: const Icon(Icons.content_paste_rounded),
                onPressed: () => copyToClipboard(textColorController.text),
              ),
              autofocus: true,
              maxLength: 9,
              inputFormatters: [
                UpperCaseTextFormatter(),
                FilteringTextInputFormatter.allow(RegExp(kValidHexPattern)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
