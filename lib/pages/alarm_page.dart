import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Text(
              'Your alarm',
              style: GoogleFonts.rubik(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: DuckDuckColors.steelBlack),
            ),
            const Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Text('data'),
              ],
            ))),
          ],
        ),
      )),
    );
  }
}
