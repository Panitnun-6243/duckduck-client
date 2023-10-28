import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/content/TimeTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimePicker extends StatelessWidget {
  final IconData? icon;
  final MaterialColor? iconColor;
  final String? image;
  final String title;
  final TimeOfDay time;
  final Function(TimeOfDay)? onChanged;
  const TimePicker(
      {super.key,
      required this.title,
      required this.time,
      this.icon,
      this.iconColor,
      this.image,
      this.onChanged});

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null) {
      onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectTime(context);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image == null
                  ? Icon(
                      icon,
                      color: iconColor,
                      size: 36,
                    )
                  : Image.asset(
                      image ?? '',
                      width: 36,
                      height: 36,
                    ),
              const SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.rubik(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TimeTextField(time: time),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
