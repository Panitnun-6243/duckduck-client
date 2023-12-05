import 'package:duckduck/models/light.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../providers/light_provider.dart';
import '../../utils/colors.dart';

class BrightnessGauge extends StatefulWidget {
  final LightMode mode;
  final double startValue;
  final Function(Light) putLight;
  final Function(double) setBulbBrightness;
  const BrightnessGauge({super.key, required this.mode, required this.startValue, required this.putLight, required this.setBulbBrightness});

  @override
  State<BrightnessGauge> createState() => _BrightnessGaugeState();
}

class _BrightnessGaugeState extends State<BrightnessGauge> {
  late double _valueRange;

  @override
  void initState() {
    super.initState();
    _valueRange = Provider.of<LightProvider>(context, listen: false).brightness;
  }

  @override
  void didUpdateWidget(covariant BrightnessGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _valueRange = widget.startValue;
    });
  }

  void onVolumeChanged(BuildContext context, double value) {
    setState(() {
      _valueRange = value.toDouble();
    });
    Provider.of<LightProvider>(context, listen: false).setBrightness(value);
    widget.setBulbBrightness(value);
  }

  void onVolumeChangeEnd(BuildContext context, double value) {
    print("brightness b $value");
    final lightProvider = Provider.of<LightProvider>(context, listen: false);
    // widget.setTemp(value.toInt());
    widget.putLight(Light(
        rgbColor: lightProvider.rgbColor,
        temperature: lightProvider.temperature,
        brightness: value,
        mode: widget.mode,
        id: lightProvider.id));
  }

  @override
  Widget build(BuildContext context) {
    
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          // canScaleToFit: true,
          centerY: 0.6,
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
              enableDragging: true,
              value: _valueRange,
              cornerStyle: CornerStyle.bothCurve,
              width: 13,
              sizeUnit: GaugeSizeUnit.logicalPixel,
              color: DuckDuckColors.duckyYellow,
            ),
            MarkerPointer(
              value: _valueRange,
              onValueChanged: (value) => onVolumeChanged(context, value),
              onValueChangeEnd: (value) => onVolumeChangeEnd(context, value),
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
                  Text('${_valueRange.toInt().toString()}%',
                      style: GoogleFonts.rubik(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: DuckDuckColors.duckyYellow)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
