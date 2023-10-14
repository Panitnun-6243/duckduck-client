import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class LightColorPicker extends StatefulWidget {
  const LightColorPicker({super.key});

  @override
  State<LightColorPicker> createState() => _LightColorPickerState();
}

class _LightColorPickerState extends State<LightColorPicker> {
  // create some values
  Color pickerColor = const Color(0xfff2DB6F);
  Color currentColor = const Color(0xfff2DB6F);
  Color tempColor = const Color(0xfff2DB6F);

  TextEditingController textColorController = TextEditingController();
// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() {
      changeTempColor(color);
      pickerColor = color;
    });
  }

  void changeTempColor(Color color) {
    setState(() {
      // changeColor(color);
      tempColor = color;
    });
  }

  void saveColor() {
    setState(() => currentColor = pickerColor);
    Navigator.of(context).pop();
  }

  void copyToClipboard(String input) {
    String textToCopy = input.replaceFirst('#', '').toUpperCase();
    if (textToCopy.startsWith('FF') && textToCopy.length == 8) {
      textToCopy = textToCopy.replaceFirst('FF', '');
    }
    Clipboard.setData(ClipboardData(text: '#$textToCopy'));
  }

  void callDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 22,
              right: 22,
              top: 22,
              bottom: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pick a color',
                            style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: DuckDuckColors.mandarinOrange),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        ColorPicker(
                          enableAlpha: true,
                          displayThumbColor: true,
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                          pickerAreaHeightPercent: 0.8,
                          paletteType: PaletteType.hsl,
                          labelTypes: const [
                            ColorLabelType.hex,
                            ColorLabelType.rgb,
                            ColorLabelType.hsl,
                            ColorLabelType.hsv
                          ],
                          pickerAreaBorderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          hexInputController: textColorController,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: CupertinoTextField(
                            controller: textColorController,
                            prefix: const Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Icon(Icons.tag)),
                            suffix: IconButton(
                              icon: const Icon(Icons.content_paste_rounded),
                              onPressed: () =>
                                  copyToClipboard(textColorController.text),
                            ),
                            autofocus: true,
                            maxLength: 9,
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                              FilteringTextInputFormatter.allow(
                                  RegExp(kValidHexPattern)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Temperature',
                            style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: DuckDuckColors.mandarinOrange),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        SlidePicker(
                          pickerColor: tempColor,
                          enableAlpha: false,
                          onColorChanged: changeColor,
                          displayThumbColor: true,
                          showParams: true,
                          showIndicator: true,
                          indicatorBorderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      'Save',
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: DuckDuckColors.mandarinOrange),
                    ),
                    onPressed: () {
                      saveColor();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    textColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            callDialog();
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 2),
              // color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: DuckDuckColors.frostWhite, width: 2),
                color: currentColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Color',
          style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: DuckDuckColors.steelBlack),
        ),
      ],
    );
  }
}
