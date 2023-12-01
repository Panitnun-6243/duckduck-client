// import 'dart:ffi';

// import 'package:duckduck/models/light.dart';
// import 'package:duckduck/widgets/light_control/brightness_gauge.dart';
// import 'package:duckduck/widgets/light_control/light_color_picker.dart';
// import 'package:duckduck/widgets/light_control/svg_bulb.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class LightWidget extends StatefulWidget {
//   final ValueNotifier<Light> lightStatus;
//   const LightWidget({required this.lightStatus, super.key});

//   @override
//   State<LightWidget> createState() => _LightWidgetState();
// }

// class _LightWidgetState extends State<LightWidget> {
//   @override
//   Widget build(BuildContext context) {
//     double bottomLightPadding = MediaQuery.of(context).size.height * 0.095;

//     return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SvgBulb(
//                 color: widget.lightStatus.value.activeColor!,
//                 brightness: widget.lightStatus.value.brightness!,
//                 levelOfBrightness: widget.lightStatus.value.levelOfBrightness!,
//               ),
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   const BrightnessGauge(),
//                   Positioned(
//                     bottom: bottomLightPadding,
//                     child: LightColorPicker(
//                         activeColor: widget.lightStatus.value.activeColor!),
//                   )
//                 ],
//               ),
//             ],
//           );
//   }
// }