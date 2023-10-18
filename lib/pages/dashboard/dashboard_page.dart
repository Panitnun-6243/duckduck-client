import 'package:duckduck/pages/dashboard/calendar_page.dart';
import 'package:duckduck/pages/dashboard/stock_page.dart';
import 'package:duckduck/pages/dashboard/traffic_page.dart';
import 'package:duckduck/pages/dashboard/weather_page.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/dashboard/alarm_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  final String assetName;
  const DashboardPage({super.key, this.assetName = 'assets/images/widget.svg'});

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
                color: DuckDuckColors.frostWhite,
                padding: EdgeInsets.only(left: 18, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Configure Dashboard',
                          style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                            color: DuckDuckColors.steelBlack,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(
                                    'Tab on a tile to adjust setting',
                                    style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                        color: DuckDuckColors.steelBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
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
                              WeatherPage(),
                              CalendarPage(),
                              SizedBox(
                                width: 10,
                              ),
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
                                StockPage(),
                                SizedBox(
                                  height: 10,
                                ),
                                TrafficPage(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 355,
                    height: 107,
                    // padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: DuckDuckColors.whippedCream,
                      borderRadius: BorderRadius.circular(21.67),
                      border: Border.all(
                        color: DuckDuckColors.duckyYellow,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: GoogleFonts.rubik(
                                    fontSize: 21.62,
                                    fontWeight: FontWeight.w600,
                                    color: DuckDuckColors.cocoa,
                                  ),
                                  children: [
                                    TextSpan(text: 'Customize\n'),
                                    TextSpan(text: 'Widget'),
                                  ]),
                            ),
                          ],
                        ),
                        Container(
                          child: SvgPicture.asset(
                            'assets/images/widget.svg',
                          ),
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
