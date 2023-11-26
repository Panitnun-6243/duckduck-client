import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chooser extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTapped;
  const Chooser(
      {super.key, required this.title, required this.icon, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DuckDuckColors.caramelCheese,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTapped,
        child: SizedBox(
            width: double.infinity,
            height: 69,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(icon, size: 32, color: DuckDuckColors.cocoa),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(title,
                          style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: DuckDuckColors.cocoa)),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: DuckDuckColors.cocoa,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
