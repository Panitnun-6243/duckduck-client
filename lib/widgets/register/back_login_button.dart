import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class BackLoginButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const BackLoginButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(67.0)),
        backgroundColor: DuckDuckColors.metalBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios_new,
            color: DuckDuckColors.frostWhite,
            size: 16,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: GoogleFonts.rubik(
              color: DuckDuckColors.frostWhite,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
