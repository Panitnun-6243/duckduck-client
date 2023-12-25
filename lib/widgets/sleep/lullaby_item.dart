import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LullabyItem extends StatelessWidget {
  final String category;
  final int numOfSongs;
  final String image;
  final void Function() onTap;
  const LullabyItem(
      {super.key,
      required this.category,
      required this.numOfSongs,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: SizedBox(
        width: 164,
        height: 222,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 164,
              height: 164,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              category,
              style: GoogleFonts.rubik(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: DuckDuckColors.skyBlue),
            ),
            Text(
              '$numOfSongs Songs',
              style: GoogleFonts.rubik(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: DuckDuckColors.skyBlue),
            ),
          ],
        ),
      ),
    );
  }
}
