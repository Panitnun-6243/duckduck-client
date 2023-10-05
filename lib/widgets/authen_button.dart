import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AuthenButton extends StatelessWidget {
  final Function()? onPressed;
  const AuthenButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          elevation: 3,
          backgroundColor: DuckDuckColors.skyBlue,
          padding: const EdgeInsets.all(10)),
      onPressed: onPressed,
      child: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
