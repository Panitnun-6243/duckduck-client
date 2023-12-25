import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final FontWeight fontWeight;

  const AlarmButton({
    super.key,
    required this.label,
    this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(128, 45),
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(67.0)),
        backgroundColor: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: textColor, size: 22),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: GoogleFonts.rubik(
              color: textColor,
              fontWeight: fontWeight,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
