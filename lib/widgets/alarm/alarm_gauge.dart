import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AlarmGauge extends StatefulWidget {
  const AlarmGauge({super.key});

  @override
  State<AlarmGauge> createState() => _AlarmGaugeState();
}

class _AlarmGaugeState extends State<AlarmGauge> {
  int value = 20;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 270,
          endAngle: 270,
          radiusFactor: 0.8,
          axisLineStyle: const AxisLineStyle(
            thickness: 0.23,
            color: DuckDuckStatus.disabled,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            const RangePointer(
              value: 60,
              width: 0.23,
              sizeUnit: GaugeSizeUnit.factor,
              color: DuckDuckColors.duckyYellow,
            ),
            const RangePointer(
              value: 20,
              width: 0.23,
              sizeUnit: GaugeSizeUnit.factor,
              // color: Colors.transparent,
              gradient: SweepGradient(
                colors: <Color>[
                  Color.fromRGBO(114, 206, 252, 1),
                  Color.fromRGBO(255, 124, 83, 1),
                ],
                stops: <double>[0.25, 0.75],
              ),
            ),
            MarkerPointer(
              value: 60,
              markerHeight: 42,
              markerWidth: 42,
              markerType: MarkerType.circle,
              color: DuckDuckColors.frostWhite,
              elevation: 1,
              borderColor: Colors.black,
              onValueChanged: (value) {
                setState(() {
                  value = value;
                });
              },
            ),
            MarkerPointer(
              value: 0,
              markerHeight: 42,
              markerWidth: 42,
              markerType: MarkerType.circle,
              color: DuckDuckColors.frostWhite,
              elevation: 4,
              borderColor: Colors.black,
              onValueChanged: (value) {
                setState(() {
                  value = value;
                });
              },
            ),
            MarkerPointer(
              value: value.toDouble(),
              markerHeight: 40,
              markerWidth: 42,
              markerType: MarkerType.circle,
              color: DuckDuckColors.frostWhite,
              elevation: 4,
              borderColor: Colors.black,
              onValueChanged: (value) {
                setState(() {
                  value = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
