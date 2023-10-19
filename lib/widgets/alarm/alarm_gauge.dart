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
  int value = 5;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          onLabelCreated: axisLabelCreated,
          minorTicksPerInterval: 2,
          // isInversed: true,
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
            // const RangePointer(
            //   value: 10,
            //   width: 28,
            //   sizeUnit: GaugeSizeUnit.logicalPixel,
            //   color: DuckDuckColors.duckyYellow,
            // ),
            // const RangePointer(
            //   value: 5,
            //   width: 28,
            //   sizeUnit: GaugeSizeUnit.logicalPixel,
            //   gradient: SweepGradient(
            //     colors: <Color>[
            //       Color.fromRGBO(255, 124, 83, 1),
            //       Color.fromRGBO(114, 206, 252, 1),
            //     ],
            //     stops: <double>[0.25, 0.75],
            //   ),
            // ),
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
              //
            ),
            MarkerPointer(
              value: _secondMarkerValue,
              markerHeight: 42,
              markerWidth: 42,
              markerType: MarkerType.circle,
              color: DuckDuckColors.frostWhite,
              elevation: 1,
              // borderColor: Colors.black,
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
                            fontSize: _annotationFontSize,
                            fontWeight: FontWeight.w600,
                            color: DuckDuckColors.skyBlue),
                      ),
                      Text(
                        '$_minutesValue minutes',
                        style: GoogleFonts.rubik(
                          fontSize: _annotationFontSize,
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

  /// Dragged pointer new value is updated to range.
  void _handleFirstPointerValueChanged(double value) {
    setState(() {
      _firstMarkerValue = value;
      final int firstMarkerValue =
          (_firstMarkerValue - _secondMarkerValue).abs().toInt();
      final String hourValue = '$firstMarkerValue';
      _annotationValue = hourValue.length == 1 ? '0' + hourValue : hourValue;
      _calculateMinutes(firstMarkerValue);
    });
  }

  /// Cancelled the dragging when pointer value reaching the axis end/start value, greater/less than another
  /// pointer value
  void _handleFirstPointerValueChanging(ValueChangingArgs args) {
    if (args.value >= _secondMarkerValue ||
        (args.value - _firstMarkerValue).abs() > 1) {
      args.cancel = true;
    }
  }

  /// Cancelled the dragging when pointer value reaching the axis end/start value, greater/less than another
  /// pointer value
  void _handleSecondPointerValueChanging(ValueChangingArgs args) {
    if (args.value <= _firstMarkerValue ||
        (args.value - _secondMarkerValue).abs() > 1) {
      args.cancel = true;
    }
  }

  /// Dragged pointer new value is updated to range.
  void _handleSecondPointerValueChanged(double value) {
    setState(() {
      _secondMarkerValue = value;
      final int secondMarkerValue =
          (_firstMarkerValue - _secondMarkerValue).abs().toInt();
      final String hourValue = '$secondMarkerValue';
      _annotationValue = hourValue.length == 1 ? '0' + hourValue : hourValue;
      _calculateMinutes(secondMarkerValue);
    });
  }

  /// Calculate the minutes value from pointer value to update in annotation.
  void _calculateMinutes(int pointerValue) {
    final double minutes =
        (_firstMarkerValue - _secondMarkerValue).abs() - pointerValue;
    final List<String> minList = minutes.toStringAsFixed(2).split('.');
    double currentMinutes = double.parse(minList[1]);
    currentMinutes = currentMinutes > 60 ? currentMinutes - 60 : currentMinutes;
    final String actualValue = currentMinutes.toInt().toString();
    _minutesValue = actualValue.length == 1 ? '0' + actualValue : actualValue;
  }

  double _borderWidth = 5;
  double _firstMarkerValue = 2;
  double _secondMarkerValue = 8;
  double _markerSize = 25;
  double _annotationFontSize = 20;
  double _thickness = 0.06;
  String _annotationValue = '06';
  String _minutesValue = '40';
  double _overlayRadius = 30;
  bool _enableDragging = true;

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
      // args.canRotate = true;
      // args.text = '100 %';
    } else {
      args.labelStyle = const GaugeTextStyle(
          color: DuckDuckColors.steelBlack,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
          fontSize: 14);
      // args.canRotate = true;
      // args.text = '100 %';
    }
  }
}
