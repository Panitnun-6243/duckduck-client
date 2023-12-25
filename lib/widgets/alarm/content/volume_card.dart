import 'package:duckduck/widgets/alarm/content/volume_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/content/volume_slider.dart';

class VoulmeCard extends StatefulWidget {
  final double volume;
  final void Function(double) onChanged;
  const VoulmeCard({super.key, required this.volume, required this.onChanged});

  @override
  State<VoulmeCard> createState() => _VoulmeCardState();
}

class _VoulmeCardState extends State<VoulmeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Icon(
                    Icons.volume_up_rounded,
                    size: 36,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Volume',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: DuckDuckColors.steelBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 200,
                        child: VolumeSlider(
                          startValue: widget.volume,
                          onChanged: widget.onChanged,
                        ))
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
