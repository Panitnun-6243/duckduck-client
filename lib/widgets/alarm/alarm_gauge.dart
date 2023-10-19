import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AlarmGauge extends StatefulWidget {
  const AlarmGauge({super.key});

  @override
  State<AlarmGauge> createState() => _AlarmGaugeState();
}

class _AlarmGaugeState extends State<AlarmGauge> {
  double _firstMarkerValue = 2;
  double _secondMarkerValue = 8;
  String _annotationValue = '06';
  String _minutesValue = '00';
  bool _enableDragging = true;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          onLabelCreated: axisLabelCreated,
          minorTicksPerInterval: 2,
          minimum: 0,
          maximum: 24,
          interval: 3,
          showFirstLabel: true,
          showLastLabel: false,
          startAngle: 270,
          endAngle: 270,
          labelOffset: 0,
          tickOffset: 12,
          majorTickStyle: const MajorTickStyle(length: 0),
          minorTickStyle: const MinorTickStyle(thickness: 2),
          axisLineStyle: const AxisLineStyle(
            thickness: 28,
            color: DuckDuckStatus.disabled,
            thicknessUnit: GaugeSizeUnit.logicalPixel,
          ),
          pointers: <GaugePointer>[
            MarkerPointer(
              markerHeight: 42,
              markerWidth: 42,
              value: _firstMarkerValue,
              onValueChanged: _handleFirstPointerValueChanged,
              // onValueChanging: _handleFirstPointerValueChanging,
              enableDragging: _enableDragging,
              markerType: MarkerType.circle,
              color: DuckDuckColors.frostWhite,
              elevation: 1,
              borderColor: Colors.black,
            ),
            MarkerPointer(
              value: _secondMarkerValue,
              markerHeight: 42,
              markerWidth: 42,
              markerType: MarkerType.circle,
              color: DuckDuckColors.frostWhite,
              elevation: 1,
              onValueChanged: _handleSecondPointerValueChanged,
              // onValueChanging: _handleSecondPointerValueChanging,
              enableDragging: _enableDragging,
            ),
          ],
          ranges: <GaugeRange>[
            GaugeRange(
              color: DuckDuckColors.duckyYellow,
              sizeUnit: GaugeSizeUnit.logicalPixel,
              startValue: _firstMarkerValue,
              endValue: _secondMarkerValue,
              startWidth: 28,
              endWidth: 28,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$_annotationValue hours',
                        style: GoogleFonts.rubik(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: DuckDuckColors.skyBlue),
                      ),
                      Text(
                        '$_minutesValue minutes',
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: DuckDuckColors.skyBlue,
                        ),
                      )
                    ],
                  ),
                ),
                positionFactor: 0.11,
                angle: 0)
          ],
        ),
      ],
    );
  }

  void _handleFirstPointerValueChanging(ValueChangingArgs args) {
    if (args.value >= 24) {
      args.value = 0;
    }
    if (args.value < 0) {
      args.value =
          23.5; // To avoid it going negative and create a max limit to 23.5 for half hour interval.
    }
    if ((args.value - _secondMarkerValue).abs() > 12) {
      args.cancel = true;
    }
  }

  void _handleFirstPointerValueChanged(double value) {
    setState(() {
      _firstMarkerValue = value;
      _calculateDuration();
    });
  }

  void _handleSecondPointerValueChanging(ValueChangingArgs args) {
    if (args.value >= 24) {
      args.value = 0;
    }
    if (args.value < 0) {
      args.value = 23.5;
    }
    if ((args.value - _firstMarkerValue).abs() > 12) {
      args.cancel = true;
    }
  }

  void _handleSecondPointerValueChanged(double value) {
    setState(() {
      _secondMarkerValue = value;
      _calculateDuration();
    });
  }

  void _calculateDuration() {
    double duration = _secondMarkerValue - _firstMarkerValue;
    if (duration < 0) {
      duration += 24;
    }
    final hours = duration.toInt();
    final minutes = ((duration - hours) * 60).toInt();
    _annotationValue = hours.toString().padLeft(2, '0');
    _minutesValue = minutes.toString().padLeft(2, '0');
  }

  void axisLabelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '0' ||
        args.text == '6' ||
        args.text == '12' ||
        args.text == '18') {
      args.labelStyle = const GaugeTextStyle(
          color: DuckDuckColors.steelBlack,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          fontSize: 18);
    } else {
      args.labelStyle = const GaugeTextStyle(
          color: DuckDuckColors.steelBlack,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          fontSize: 14);
    }
  }
}
