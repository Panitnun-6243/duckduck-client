import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

WidgetPointer IconPointer(
    {required double value,
    required Function(double)? onValueChanged,
    required bool enableDragging,
    required IconData icon,
    MaterialColor? iconColor}) {
  return WidgetPointer(
    value: value,
    onValueChanged: onValueChanged,
    // onValueChanging: _handlebedtimePointerValueChanging,
    enableDragging: enableDragging,
    child: Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
          color: DuckDuckColors.frostWhite,
          borderRadius: BorderRadius.all(Radius.circular(48)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 4,
                offset: Offset(0, -2))
          ]),
      child: Icon(
        icon,
        color: iconColor ?? DuckDuckColors.steelBlack,
        size: 30,
      ),
    ),
  );
}

WidgetPointer ImagePointer(
    {required double value,
    required Function(double)? onValueChanged,
    required bool enableDragging,
    required String image,
    MaterialColor? iconColor}) {
  return WidgetPointer(
    value: value,
    onValueChanged: onValueChanged,
    // onValueChanging: _handlebedtimePointerValueChanging,
    enableDragging: enableDragging,
    child: Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
          color: DuckDuckColors.steelBlack,
          borderRadius: BorderRadius.all(Radius.circular(36)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 4,
                offset: Offset(0, -2))
          ]),
      child: Center(
        child: Image.asset(
          image,
          width: 24,
          height: 24,
        ),
      ),
    ),
  );
}

class AlarmGauge extends StatefulWidget {
  final Function(String, TimeOfDay) updateTime;
  const AlarmGauge({super.key, required this.updateTime});

  @override
  State<AlarmGauge> createState() => _AlarmGaugeState();
}

class _AlarmGaugeState extends State<AlarmGauge> {
  double _bedtimeMarkerValue = 22;
  double _wakeupMarkerValue = 6;
  double _startMarkerValue = 3.5;
  double _peakMarkerValue = 5.5;
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
            IconPointer(
              value: _bedtimeMarkerValue,
              onValueChanged: _handlebedtimePointerValueChanged,
              enableDragging: _enableDragging,
              icon: Icons.bedtime,
              iconColor: DuckDuckColors.metalBlue,
            ),
            IconPointer(
                value: _wakeupMarkerValue,
                onValueChanged: _handlewakeupPointerValueChanged,
                enableDragging: _enableDragging,
                icon: Icons.sunny,
                iconColor: DuckDuckColors.mandarinOrange),
            ImagePointer(
                value: _startMarkerValue,
                onValueChanged: _handlestartPointerValueChanged,
                enableDragging: _enableDragging,
                image: "assets/images/sunrise_red.png"),
            ImagePointer(
                value: _peakMarkerValue,
                onValueChanged: _handlepeakPointerValueChanged,
                enableDragging: _enableDragging,
                image: "assets/images/sun_blue.png"),
          ],
          ranges: <GaugeRange>[
            GaugeRange(
              color: DuckDuckColors.duckyYellow,
              sizeUnit: GaugeSizeUnit.logicalPixel,
              startValue: _bedtimeMarkerValue,
              endValue: _wakeupMarkerValue,
              startWidth: 28,
              endWidth: 28,
            ),
            GaugeRange(
              // color: Color.fromARGB(0xff, 0xff, 0x7c, 0x53),
              gradient: const SweepGradient(
                colors: <Color>[
                  Color.fromRGBO(255, 124, 83, 1),
                  Color.fromRGBO(114, 206, 252, 1),
                ],
                stops: <double>[0.25, 0.75],
              ),
              sizeUnit: GaugeSizeUnit.logicalPixel,
              startValue: _startMarkerValue,
              endValue: _peakMarkerValue,
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
                      Text('$_annotationValue hours',
                          style: GoogleFonts.rubik(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: DuckDuckColors.steelBlack,
                          )),
                      Text(
                        '$_minutesValue minutes',
                        style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: DuckDuckColors.steelBlack,
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

  void _handlebedtimePointerValueChanging(ValueChangingArgs args) {
    if (args.value >= 24) {
      args.value = 0;
    }
    if (args.value < 0) {
      args.value =
          23.5; // To avoid it going negative and create a max limit to 23.5 for half hour interval.
    }
    if ((args.value - _wakeupMarkerValue).abs() > 12) {
      args.cancel = true;
    }
  }

  void _handlebedtimePointerValueChanged(double value) {
    setState(() {
      _bedtimeMarkerValue = value;
      _calculateDuration();
      widget.updateTime(
          "bedtime",
          TimeOfDay(
              hour: value.floor(),
              minute: ((value - value.floor()) * 60).floor()));
    });
  }

  void _handlewakeupPointerValueChanging(ValueChangingArgs args) {
    if (args.value >= 24) {
      args.value = 0;
    }
    if (args.value < 0) {
      args.value = 23.5;
    }
    if ((args.value - _bedtimeMarkerValue).abs() > 12) {
      args.cancel = true;
    }
  }

  void _handlewakeupPointerValueChanged(double value) {
    setState(() {
      _wakeupMarkerValue = value;
      _calculateDuration();
      widget.updateTime(
          "wakeup",
          TimeOfDay(
              hour: value.floor(),
              minute: ((value - value.floor()) * 60).floor()));
    });
  }

  void _handlestartPointerValueChanged(double value) {
    setState(() {
      _startMarkerValue = value;
      _calculateDuration();
      widget.updateTime(
          "start",
          TimeOfDay(
              hour: value.floor(),
              minute: ((value - value.floor()) * 60).floor()));
    });
  }

  void _handlepeakPointerValueChanged(double value) {
    setState(() {
      _peakMarkerValue = value;
      _calculateDuration();
      widget.updateTime(
          "peak",
          TimeOfDay(
              hour: value.floor(),
              minute: ((value - value.floor()) * 60).floor()));
    });
  }

  void _calculateDuration() {
    double duration = _wakeupMarkerValue - _bedtimeMarkerValue;
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
