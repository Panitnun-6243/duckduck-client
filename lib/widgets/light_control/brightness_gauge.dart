import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../providers/light_provider.dart';
import '../../utils/colors.dart';

class BrightnessGauge extends StatefulWidget {
  const BrightnessGauge({super.key});

  @override
  State<BrightnessGauge> createState() => _BrightnessGaugeState();
}

class _BrightnessGaugeState extends State<BrightnessGauge> {
  String _volumeValue = '50';
  double _valueRange = 50;

  void onVolumeChanged(double value) {
    setState(() {
      final int gaugeValue = value.toInt();
      _valueRange = value.toDouble();
      _volumeValue = '$gaugeValue';
    });
    Provider.of<LightProvider>(context, listen: false).setBrightness(value);
  }

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          // canScaleToFit: true,
          centerY: 0.7,
          minimum: 0,
          maximum: 100,
          startAngle: 180,
          endAngle: 0,
          showLabels: false,
          showTicks: false,
          axisLineStyle: const AxisLineStyle(
            cornerStyle: CornerStyle.bothCurve,
            color: DuckDuckStatus.disabled,
            thickness: 13,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              onValueChanged: onVolumeChanged,
              enableDragging: true,
              value: _valueRange,
              cornerStyle: CornerStyle.bothCurve,
              width: 13,
              sizeUnit: GaugeSizeUnit.logicalPixel,
              color: DuckDuckColors.duckyYellow,
            ),
            MarkerPointer(
              value: _valueRange,
              onValueChanged: onVolumeChanged,
              enableDragging: true,
              markerHeight: 41,
              markerWidth: 41,
              markerType: MarkerType.image,
              imageUrl: 'assets/images/light-pointer2.png',
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              verticalAlignment: GaugeAlignment.far,
              horizontalAlignment: GaugeAlignment.center,
              axisValue: 50,
              positionFactor: 0.6,
              widget: Text(
                'Brightness',
                style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: DuckDuckColors.steelBlack),
              ),
            ),
            GaugeAnnotation(
              verticalAlignment: GaugeAlignment.far,
              horizontalAlignment: GaugeAlignment.center,
              positionFactor: 0.2,
              axisValue: 50,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_volumeValue,
                      style: GoogleFonts.rubik(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: DuckDuckColors.duckyYellow)),
                  Text('%',
                      style: GoogleFonts.rubik(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: DuckDuckColors.duckyYellow))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
