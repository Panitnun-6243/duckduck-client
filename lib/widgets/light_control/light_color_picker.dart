import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../models/light.dart';
import '../../providers/light_provider.dart';
import '../../utils/colors.dart';
import '../../utils/kelvin_to_rgb.dart';

class LightColorPicker extends StatefulWidget {
  const LightColorPicker({super.key});

  @override
  State<LightColorPicker> createState() => _LightColorPickerState();
}

class _LightColorPickerState extends State<LightColorPicker> {
  Color rgbColor = const Color(0xfff2DB6F);
  Color pickerColor = const Color(0xfff2DB6F);
  late int tempKelvin;
  int pickerTempKelvin = 4000;

  TextEditingController textColorController = TextEditingController();

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
      Provider.of<LightProvider>(context, listen: false).setColor(pickerColor);
    });
  }

  // void changeTempKelvin(double kelvin) {
  //   setState(() {
  //     pickerTempKelvin = kelvin.toInt();
  //     Provider.of<LightProvider>(context, listen: false)
  //         .setTemperature(pickerTempKelvin);
  //   });
  // }

  void saveColor() {
    setState(() => rgbColor = pickerColor);
    Provider.of<LightProvider>(context, listen: false)
        .setMode(LightMode.rgb); // set mode to RGB
    Provider.of<LightProvider>(context, listen: false).setColor(rgbColor);
    Navigator.of(context).pop();
  }

  void saveTempKelvin() {
    setState(() => tempKelvin = pickerTempKelvin);
    Provider.of<LightProvider>(context, listen: false)
        .setMode(LightMode.temperature); // set mode to CCT
    Provider.of<LightProvider>(context, listen: false)
        .setTemperature(pickerTempKelvin);
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
        return DefaultTabController(
            initialIndex: Provider.of<LightProvider>(context, listen: false)
                .currentModeTab,
            length: 2,
            child: Builder(builder: (BuildContext innerContext) {
              final TabController tabController =
                  DefaultTabController.of(innerContext);
              tabController.addListener(() {
                // ตรวจจับการทำงาน
                if (tabController.index == 0) {
                  Provider.of<LightProvider>(context, listen: false)
                      .setMode(LightMode.rgb);
                } else {
                  Provider.of<LightProvider>(context, listen: false)
                      .setMode(LightMode.temperature);
                }
              });
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                    right: 22,
                    top: 12,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      const TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        labelColor: DuckDuckColors.mandarinOrange,
                        indicatorColor: DuckDuckColors.mandarinOrange,
                        tabs: [
                          Tab(text: 'RGB'),
                          Tab(text: 'CCT'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildRGBPicker(),
                            _buildTemperaturePicker(),
                          ],
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
                              color: DuckDuckColors.mandarinOrange,
                            ),
                          ),
                          onPressed: () {
                            if (Provider.of<LightProvider>(context,
                                        listen: false)
                                    .currentMode ==
                                LightMode.rgb) {
                              saveColor();
                            } else {
                              saveTempKelvin();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
      },
    );
  }

  Widget _buildRGBPicker() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
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

  Widget _buildTemperaturePicker() {
    // Extract Kelvin values and their corresponding RGB colors
    List<double> kelvinKeys =
        kelvinTable.keys.map((k) => k.toDouble()).toList();
// Reverse the colors
    List<Color> reversedKelvinColors =
        kelvinTable.values.toList().reversed.toList();

    LinearGradient createKelvinGradient() {
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: reversedKelvinColors, // use the reversed colors here
        stops: kelvinKeys
            .map((k) =>
                (k - kelvinKeys.first) / (kelvinKeys.last - kelvinKeys.first))
            .toList(),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Adjust Temperature (K)',
            style: GoogleFonts.rubik(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: DuckDuckColors.steelBlack,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StatefulBuilder(builder: (context, state) {
            return SfLinearGauge(
              minimum: kelvinTable.keys.first.toDouble(),
              maximum: kelvinTable.keys.last.toDouble(),
              orientation: LinearGaugeOrientation.vertical,
              barPointers: [
                LinearBarPointer(value: pickerTempKelvin.toDouble())
              ],
              markerPointers: [
                LinearShapePointer(
                  dragBehavior: LinearMarkerDragBehavior.free,
                  value: pickerTempKelvin.toDouble(),
                  color: DuckDuckColors.steelBlack,
                  onChanged: (kelvin) {
                    state(
                      () {
                        pickerTempKelvin = kelvin.toInt();
                        Provider.of<LightProvider>(context, listen: false)
                            .setTemperature(pickerTempKelvin);
                      },
                    );
                  },
                )
              ],
              ranges: <LinearGaugeRange>[
                LinearGaugeRange(
                  startValue: kelvinTable.keys.first.toDouble(),
                  endValue: kelvinTable.keys.last.toDouble(),
                  startWidth: 50,
                  shaderCallback: (bounds) =>
                      createKelvinGradient().createShader(bounds),
                )
              ],
            );
          }),
        ],
      ),
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
                color: rgbColor,
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
