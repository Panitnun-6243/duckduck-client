import 'package:duckduck/providers/sleep_provider.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/sleep/analysis_graph.dart';
import 'package:duckduck/widgets/sleep/sweet_dreams.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SleepClinicPage extends StatefulWidget {
  const SleepClinicPage({super.key});

  @override
  State<SleepClinicPage> createState() => _SleepClinicPageState();
}

class _SleepClinicPageState extends State<SleepClinicPage> {
  @override
  void initState() {
    Provider.of<SleepProvider>(context, listen: false).initProvider();
    super.initState();
  }

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
