import 'package:duckduck/widgets/light_control/rgb_picker.dart';
import 'package:duckduck/widgets/light_control/temperature_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/light.dart';
import '../../providers/light_provider.dart';
import '../../utils/colors.dart';

class LightColorPicker extends StatefulWidget {
  final LightMode mode;
  final double brightness;
  final Color color;
  final LightProvider lightProvider;
  final void Function(Light, LightMode) putLight;
  final void Function(Color, double) setBulb;
  final void Function(LightMode) setMode;
  final void Function(int) setTemp;
  const LightColorPicker(
      {super.key, required this.mode, required this.brightness, required this.color, required this.lightProvider, required this.setBulb, required this.setMode, required this.setTemp, required this.putLight});

  @override
  State<LightColorPicker> createState() => _LightColorPickerState();
}

class _LightColorPickerState extends State<LightColorPicker> {
  late Color activeColor;
  late Color rgbColor;
  late Color pickerColor;
  late int pickerTempKelvin;
  late int tempKelvin;
  TextEditingController textColorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    rgbColor = widget.lightProvider.rgbColor;
    pickerColor = widget.lightProvider.rgbColor;
    pickerTempKelvin = widget.lightProvider.temperature;
    tempKelvin = widget.lightProvider.temperature;
    print("start with mode ${widget.mode}");
  }

  void setTempKelvin(int newTemp) {
    tempKelvin = newTemp;
    widget.setTemp(newTemp);
  }

  void _changeColor(Color color) {
    setState(
      () {
        pickerColor = color;
        widget.lightProvider.setColor(pickerColor);
        // if (lightProvider.currentMode == LightMode.rgb) {
        //   widget.putLight(
        //       Light(
        //           rgbColor: pickerColor,
        //           brightness: lightProvider.brightness,
        //           id: lightProvider.id),
        //       LightMode.rgb);
        // }
      },
    );
  }

  void _saveChanges(BuildContext context) {
    print("current ${widget.lightProvider.currentMode} vs ${widget.mode}");
    if (widget.mode == LightMode.rgb) {
      print("save rgb");
      widget.lightProvider.setColor(pickerColor);
      HSLColor hslColor = HSLColor.fromColor(pickerColor);
      widget.putLight(
          Light(
              rgbColor: pickerColor,
              brightness: hslColor.lightness * 100,
              id: widget.lightProvider.id),
          LightMode.rgb);
      // setState(() => rgbColor = pickerColor);
      widget.setBulb(pickerColor, hslColor.lightness * 100);
    } else if (widget.mode == LightMode.temperature) {
      print("save temp ${widget.brightness}");
      widget.lightProvider.setTemperature(tempKelvin);
      widget.putLight(
          Light(
              temperature: tempKelvin,
              brightness: widget.brightness,
              id: widget.lightProvider.id),
          LightMode.temperature);
      // setState(() => tempKelvin = pickerTempKelvin);
      // tempKelvin = pickerTempKelvin;
      widget.setBulb(Light.getColorFromTemperature(tempKelvin), widget.brightness);
    } else {
      print("Unknown mode: ${widget.lightProvider.currentMode}");
    }
    Navigator.of(context).pop();
  }

  void callDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DefaultTabController(
            initialIndex: widget.mode == LightMode.rgb ? 0 : 1,
            length: 2,
            child: Builder(builder: (BuildContext innerContext) {
              final TabController tabController =
                  DefaultTabController.of(innerContext);
              tabController.addListener(
                () {
                  if (tabController.index == 1) {
                    print("switch to temp");
                    widget.setMode(LightMode.temperature);
                    widget.lightProvider.setMode(LightMode.temperature);
                  } else {
                    print("switch to rgb");
                    widget.setMode(LightMode.rgb);
                    widget.lightProvider.setMode(LightMode.rgb);
                  }
                },
              );
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
                          Tab(text: 'HSL'),
                          Tab(text: 'CCT'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            RgbPicker(
                                textColorController: textColorController,
                                pickerColor: pickerColor,
                                changeColor: _changeColor),
                            TemperaturePicker(
                              startTempKelvin: tempKelvin,
                              setTempKelvin: setTempKelvin,
                            ),
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
                            _saveChanges(context);
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

  @override
  void dispose() {
    textColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lightProvider = context.watch<LightProvider>();
    print("build ${lightProvider.activeColor}");
    return Column(
      children: [
        InkWell(
          onTap: () => callDialog(context),
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
                color: widget.color,
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
