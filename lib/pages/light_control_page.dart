import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class LightControlPage extends StatefulWidget {
  const LightControlPage({super.key});

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  @override
  Widget build(BuildContext context) {
    double _bottomPadding = MediaQuery.of(context).size.height * 0.05;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 35,
            right: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              Stack(
                alignment: Alignment.center,
                children: [
                  SfRadialGauge(
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
                        pointers: const <GaugePointer>[
                          RangePointer(
                            value: 70,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 13,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            color: DuckDuckColors.duckyYellow,
                          ),
                          MarkerPointer(
                            value: 70,
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
                              widget: Text('70%',
                                  style: GoogleFonts.rubik(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                      color: DuckDuckColors.duckyYellow))),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: _bottomPadding,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: DuckDuckStatus.disabledForeground,
                                width: 2),
                            // color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: DuckDuckColors.frostWhite, width: 2),
                              color: DuckDuckStatus.success,
                              shape: BoxShape.circle,
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
