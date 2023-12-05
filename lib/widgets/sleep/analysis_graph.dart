import 'package:duckduck/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/sleep_data.dart';
import '../../providers/sleep_provider.dart';

class AnalysisGraph extends StatefulWidget {
  const AnalysisGraph({super.key});

  @override
  State<AnalysisGraph> createState() => _AnalysisGraphState();
}

class _AnalysisGraphState extends State<AnalysisGraph> {
  late TooltipBehavior _tooltipBehavior;
  late List<ChartData> chartData;
  // List<SleepData> rawData = [
  //   SleepData(date: "2023-11-21", sleepDurationHours: 7),
  //   SleepData(date: "2023-11-22", sleepDurationHours: 5),
  //   SleepData(date: "2023-11-23", sleepDurationHours: 3.5),
  //   SleepData(date: "2023-11-24", sleepDurationHours: 7),
  //   SleepData(date: "2023-11-25", sleepDurationHours: 5),
  //   SleepData(date: "2023-11-26", sleepDurationHours: 6.5),
  //   SleepData(date: "2023-11-27", sleepDurationHours: 6),
  // ];

  List<ChartData> processSleepData(List<SleepData> rawData) {
    rawData.sort(
      (a, b) => DateTime.parse(b.date).compareTo(
        DateTime.parse(a.date),
      ),
    );
    List<SleepData> latestData = rawData.take(7).toList();

    // Map to ChartData objects
    return latestData
        .map((sleepData) {
          DateTime date = DateTime.parse(sleepData.date);
          String dayOfWeek = _getDayOfWeek(date);
          return ChartData(dayOfWeek, sleepData.sleepDurationHours);
        })
        .toList()
        .reversed
        .toList(); // Reverse to make the chart start from the oldest of the 7 days
  }

  String _getDayOfWeek(DateTime date) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    // chartData = processSleepData(rawData);
  }

  @override
  Widget build(BuildContext context) {
    final sleepProvider = Provider.of<SleepProvider>(context);
    chartData = processSleepData(sleepProvider.sleepStats);

    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      tooltipBehavior: _tooltipBehavior,
      title: ChartTitle(
        text: 'Statistics (hours)',
        textStyle: GoogleFonts.rubik(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: DuckDuckColors.steelBlack),
        alignment: ChartAlignment.near,
      ),
      series: <ChartSeries<ChartData, String>>[
        ColumnSeries<ChartData, String>(
          color: DuckDuckColors.skyBlue,
          enableTooltip: true,
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          spacing: 0.1,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
