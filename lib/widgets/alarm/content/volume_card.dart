import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

class VoulmeCard extends StatefulWidget {
  const VoulmeCard({super.key});

  @override
  State<VoulmeCard> createState() => _VoulmeCardState();
}

class _VoulmeCardState extends State<VoulmeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(1.0),
                child: Icon(
                  Icons.volume_up_rounded,
                  size: 36,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Volume',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: DuckDuckColors.steelBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Container(
                  // width: double.maxFinite,
                  // child: CupertinoSlider(
                  //   min: 0.0,
                  //   max: 100.0,
                  //   value: _VoulmeCardState,
                  //   activeColor: DuckDuckColors.duckyYellow,
                  //   thumbColor: DuckDuckStatus.disabledForeground,
                  // ),
                  // ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
