import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/sleep/analysis_graph.dart';
import 'package:duckduck/widgets/sleep/sweet_dreams.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepClinicPage extends StatelessWidget {
  const SleepClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Sleep Clinic',
                style: GoogleFonts.rubik(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: DuckDuckColors.steelBlack),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        AnalysisGraph(),
                        SizedBox(
                          height: 40,
                        ),
                        SweetDreams()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
