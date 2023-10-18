import 'package:duckduck/pages/dashboard/stock_page.dart';
import 'package:duckduck/pages/dashboard/traffic_page.dart';
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
                padding: EdgeInsets.only(left: 18, top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Configure Dashboard ',
                          style: GoogleFonts.rubik(
                            textStyle: TextStyle(
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
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 18, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Tab on a tile to adjust setting',
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                            color: DuckDuckColors.steelBlack,
                            fontSize: 16,
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
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
              SizedBox(
                height: 10,
              ),
              WidgetCard(),
            ],
          ),
        ),
      ),
    );
  }
}
