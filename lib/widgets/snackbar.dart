import 'package:flutter/material.dart';

class DuckDuckSnackbar {
  String text;
  IconData? icon;
  MaterialColor? accentColor;
  DuckDuckSnackbar({required this.text, this.icon, this.accentColor});

  void show(BuildContext context) {
    SnackBar _snackBar = SnackBar(
      content: Row(children: [
        icon != null ? Icon(icon, color: accentColor) : Container(),
        const SizedBox(width: 10.0),
        Text(text)
      ]),
    );
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }
}
