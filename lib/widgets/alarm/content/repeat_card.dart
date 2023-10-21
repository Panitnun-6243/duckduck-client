import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

class RepeatCard extends StatefulWidget {
  const RepeatCard({super.key});

  @override
  State<RepeatCard> createState() => _RepeatCardState();
}

class _RepeatCardState extends State<RepeatCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.loop_rounded,
                size: 36,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Repeat',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: DuckDuckColors.steelBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Row(

                  // )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
