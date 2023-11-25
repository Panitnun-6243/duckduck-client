import 'package:dio/dio.dart';
import 'package:duckduck/models/light.dart';
import 'package:duckduck/pages/widgets/light_widget.dart';
import 'package:duckduck/providers/light_provider.dart';
import 'package:duckduck/widgets/light_control/brightness_gauge.dart';
import 'package:duckduck/widgets/light_control/light_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/light_control/svg_bulb.dart';

class LightControlPage extends StatefulWidget {
  final ValueNotifier<Light> lightStatus;
  final Future<Light> Function() fetchLight;
  const LightControlPage({required this.lightStatus, required this.fetchLight, super.key});

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  late Future<Light> futureLight;

  @override
  void initState() {
    super.initState();
    futureLight = widget.fetchLight();
  }
  
  @override
  Widget build(BuildContext context) {
    final lightProvider = context.watch<LightProvider>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: DuckDuckColors.steelBlack,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            child: 
            FutureBuilder<Light>(future: futureLight, builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              widget.lightStatus.value = snapshot.data!;
              return LightWidget(lightStatus: widget.lightStatus);
            })
          ),
        ),
      ),
    );
  }
}
