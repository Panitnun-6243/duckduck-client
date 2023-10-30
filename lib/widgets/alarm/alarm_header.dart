import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmHeader extends StatelessWidget {
  final String alarmName;
  final bool isEditing;
  final Function(bool?)? onToggle;
  final Function(String)? onChanged;
  const AlarmHeader(
      {super.key,
      this.isEditing = false,
      this.onToggle,
      this.onChanged,
      required this.alarmName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: DuckDuckColors.frostWhite,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: isEditing
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: TextField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Alarm name',
                          ),
                          onChanged: (newName) {
                            print("call onchanged with $newName");
                            onChanged?.call(newName);
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(
                          Icons.check,
                          color: DuckDuckStatus.success,
                        ),
                        onPressed: () => onToggle?.call(false),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        alarmName,
                        style: GoogleFonts.rubik(
                            color: DuckDuckColors.steelBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(
                          Icons.mode_edit,
                          color: DuckDuckColors.skyBlue,
                        ),
                        onPressed: () => onToggle?.call(true),
                      ),
                    ],
                  ),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close,
                color: DuckDuckStatus.disabledForeground),
          )
        ],
      ),
    );
  }
}
