import 'package:duckduck/widgets/light_control/rgb_picker.dart';
import 'package:duckduck/widgets/light_control/temperature_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/light.dart';
import '../../providers/light_provider.dart';
import '../../utils/colors.dart';

class LightColorPicker extends StatefulWidget {
  final Color activeColor;
  const LightColorPicker({super.key, required this.activeColor});

  @override
  State<LightColorPicker> createState() => _LightColorPickerState();
}

class _LightColorPickerState extends State<LightColorPicker> {
  late LightProvider lightProvider;

  late Color rgbColor = lightProvider.rgbColor;
  late Color pickerColor = lightProvider.rgbColor;
  late int pickerTempKelvin = lightProvider.temperature;
  late int tempKelvin;
  TextEditingController textColorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    lightProvider = Provider.of<LightProvider>(context, listen: false);
  }

  void _changeColor(Color color) {
    setState(
      () {
        pickerColor = color;
        lightProvider.setColor(pickerColor);
      },
    );
  }

  void _saveChanges() {
    if (lightProvider.currentMode == LightMode.rgb) {
      setState(() => rgbColor = pickerColor);
      lightProvider.setColor(rgbColor);
    } else {
      setState(() => tempKelvin = pickerTempKelvin);
      lightProvider.setTemperature(tempKelvin);
    }
    Navigator.of(context).pop();
  }

  void callDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DefaultTabController(
            initialIndex: lightProvider.currentModeTab,
            length: 2,
            child: Builder(builder: (BuildContext innerContext) {
              final TabController tabController =
                  DefaultTabController.of(innerContext);
              tabController.addListener(
                () {
                  if (tabController.index == 1) {
                    lightProvider.setMode(LightMode.temperature);
                  } else {
                    lightProvider.setMode(LightMode.rgb);
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
                            const TemperaturePicker(),
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
                            _saveChanges();
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
                color: lightProvider.activeColor,
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
