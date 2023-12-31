import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/dashboard/alarm_widget.dart';
import 'package:duckduck/widgets/dashboard/calendar_widget.dart';
import 'package:duckduck/widgets/dashboard/stock_widget.dart';
import 'package:duckduck/widgets/dashboard/traffic_widget.dart';
import 'package:duckduck/widgets/dashboard/weather_widget.dart';
import 'package:duckduck/widgets/dashboard/widget_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 18, top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Configure Dashboard ',
                          style: GoogleFonts.rubik(
                            textStyle: const TextStyle(
                              color: DuckDuckColors.steelBlack,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 18, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Tab on a tile to adjust settings',
                          style: GoogleFonts.rubik(
                              textStyle: const TextStyle(
                            color: DuckDuckColors.steelBlack,
                            fontSize: 16,
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: AlarmWidget(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WeatherWidget(),
                              CalendarWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                StockWidget(),
                                TrafficWidget(),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const WidgetCard(),
            ],
          ),
        ),
      ),
    );
  }
}
