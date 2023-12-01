import 'package:duckduck/models/light.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../providers/light_provider.dart';
import '../../utils/colors.dart';
import '../../utils/kelvin_to_rgb.dart';

class TemperaturePicker extends StatelessWidget {
  const TemperaturePicker({super.key});

  @override
  Widget build(BuildContext context) {
    late int pickerTempKelvin =
        Provider.of<LightProvider>(context, listen: false).temperature;

    List<double> kelvinKeys =
        kelvinTable.keys.map((k) => k.toDouble()).toList();

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
}
