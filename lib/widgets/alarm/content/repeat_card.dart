import 'package:duckduck/widgets/alarm/content/DayTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

const days = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];

class RepeatCard extends StatefulWidget {
  final Function(List<bool>) onRepeatChanged;
  final List<bool> initialSelectedDays;
  const RepeatCard({
    super.key,
    required this.onRepeatChanged,
    this.initialSelectedDays = const [
      false,
      true,
      false,
      false,
      false,
      false,
      false
    ],
  });

  @override
  State<RepeatCard> createState() => _RepeatCardState();
}

class _RepeatCardState extends State<RepeatCard> {
  List<bool> selected = [false, true, false, false, false, false, false];

  void toggle(int index) {
    int selectedCount = 0;
    for (int i = 0; i < selected.length; i++) {
      if (selected[i] == true) {
        selectedCount += 1;
      }
    }
    print("selected count $selectedCount");
    if (selectedCount == 1 && selected[index] == true) {
      return;
    }
    setState(() {
      selected[index] = !selected[index];
      print(selected);
      widget.onRepeatChanged(selected);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = widget.initialSelectedDays;
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setState(() {
    //     widget.onRepeatChanged(selected);
    //   });
    // });
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
                        text: days[index].toUpperCase(),
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
