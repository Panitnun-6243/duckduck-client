import 'package:duckduck/models/light.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../providers/light_provider.dart';
import '../../utils/colors.dart';
import '../../utils/kelvin_to_rgb.dart';

class TemperaturePicker extends StatefulWidget {
  final int startTempKelvin;
  final void Function(int) setTempKelvin;
  const TemperaturePicker({super.key, required this.startTempKelvin, required this.setTempKelvin});

  @override
  State<TemperaturePicker> createState() => _TemperaturePickerState();
}

class _TemperaturePickerState extends State<TemperaturePicker> {
  List<double> kelvinKeys =
        kelvinTable.keys.map((k) => k.toDouble()).toList();

  List<Color> reversedKelvinColors =
      kelvinTable.values.toList().reversed.toList();

  late int pickerTempKelvin;

  @override
  void initState() {
    super.initState();
    pickerTempKelvin = widget.startTempKelvin;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      pickerTempKelvin = context.read<LightProvider>().temperature;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              minimum: 3000.00,
              maximum: 7000.00,
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
                        // Provider.of<LightProvider>(context, listen: false)
                        //     .setTemperature(pickerTempKelvin);
                      },
                    );
                  },
                  onChangeEnd: (kelvin) => widget.setTempKelvin(kelvin.toInt()),
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
