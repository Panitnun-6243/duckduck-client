import 'package:duckduck/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalysisGraph extends StatefulWidget {
  AnalysisGraph({super.key});

  final Color barBackgroundColor = DuckDuckStatus.disabled;
  final Color barColor = DuckDuckColors.skyBlue;
  final Color touchedBarColor = DuckDuckColors.duckyYellow;

  @override
  State<AnalysisGraph> createState() => _AnalysisGraphState();
}

class _AnalysisGraphState extends State<AnalysisGraph> {
  final Duration animDuration = const Duration(milliseconds: 250);
  int touchedIndex = -1;

  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 2, child: BarChart(BarChartData()));
  }
}
