import 'package:duckduck/widgets/alarm/content/snooze_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

class SnoozeCard extends StatefulWidget {
  final int initialDuration;
  final Function(int duration) onDurationChanged;
  const SnoozeCard(
      {super.key,
      required this.initialDuration,
      required this.onDurationChanged});

  @override
  State<SnoozeCard> createState() => _SnoozeCardState();
}

class _SnoozeCardState extends State<SnoozeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(1.0),
                child: Icon(
                  Icons.snooze_rounded,
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
                    'Snooze',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: DuckDuckColors.steelBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SnoozeMenu(
                      initialDuration: widget.initialDuration,
                      onDurationChanged: widget.onDurationChanged)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
