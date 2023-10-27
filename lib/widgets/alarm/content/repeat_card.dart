import 'package:duckduck/widgets/alarm/content/DayTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

const days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

class RepeatCard extends StatefulWidget {
  const RepeatCard({super.key});

  @override
  State<RepeatCard> createState() => _RepeatCardState();
}

class _RepeatCardState extends State<RepeatCard> {
  List<bool> selected = [false, false, false, false, false, false, false];

  void toggle(int index) {
    setState(() {
      selected[index] = !selected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
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
              SizedBox(
                width: 240,
                height: 32,
                child: ListView.separated(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 5),
                    itemBuilder: (BuildContext context, int index) {
                      return DayTile(
                        text: days[index],
                        isSelected: selected[index],
                        onClick: () {
                          toggle(index);
                        },
                      );
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
