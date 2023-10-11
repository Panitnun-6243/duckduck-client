import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.name,
      this.profileImageUrl = 'https://via.placeholder.com/150'});
  final String profileImageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 42.0,
            backgroundImage: NetworkImage(profileImageUrl),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Text(
              'Good morning, $name 😁',
              style: GoogleFonts.rubik(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: DuckDuckColors.steelBlack),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
