import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

class WideButton extends StatelessWidget {
  final String text;
  final MaterialColor foregroundColor;
  final MaterialColor backgroundColor;
  final bool disabled;
  final bool isElevated;
  final bool isBold;
  final bool isLoading;
  final double height;
  final IconData? icon;
  final Function()? onPressed;
  const WideButton(
      {Key? key,
      required this.text,
      this.foregroundColor = DuckDuckColors.frostWhite,
      this.backgroundColor = DuckDuckColors.skyBlue,
      this.disabled = false,
      this.isElevated = true,
      this.isBold = true,
      this.isLoading = false,
      this.height = 35,
      this.icon,
      required this.onPressed,
      required MaterialColor iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          boxShadow: isElevated && !isLoading && !disabled
              ? const <BoxShadow>[
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 4.0,
                      offset: Offset(2.0, 1.0))
                ]
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: ElevatedButton(
        onPressed: !(disabled || isLoading) ? onPressed : null,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor[600];
              } else if (states.contains(MaterialState.disabled)) {
                return backgroundColor[300];
              }
              return backgroundColor;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(67.0),
            )),
            elevation: MaterialStateProperty.all<double>(0.0),
            minimumSize:
                MaterialStateProperty.all<Size>(const Size.fromHeight(35.0))),
        child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 0.0, right: 0.0),
            child: isLoading
                ? const SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon == null
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Icon(icon)),
                      Text(text,
                          style: GoogleFonts.rubik(
                              color: foregroundColor,
                              fontWeight:
                                  isBold ? FontWeight.w500 : FontWeight.normal,
                              fontSize: 16)),
                    ],
                  )),
      ),
    );
  }
}
