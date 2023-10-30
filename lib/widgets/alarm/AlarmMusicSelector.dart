import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/SoundRadioList.dart';
import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:duckduck/widgets/confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class AlarmMusicSelector extends StatefulWidget {
  final BuildContext dialogContext;
  const AlarmMusicSelector({super.key, required this.dialogContext});

  @override
  State<AlarmMusicSelector> createState() => _AlarmMusicSelectorState();
}

class _AlarmMusicSelectorState extends State<AlarmMusicSelector> {
  int value = 0;
  String groupValue = "Classic";
  String groupValue2 = "Radial";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: DuckDuckColors.frostWhite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: DuckDuckStatus.disabledForeground,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.chevron_left_outlined),
                            onPressed: () {
                              Navigator.pop(widget.dialogContext);
                            },
                            color: DuckDuckStatus.disabledForeground,
                            iconSize: 36,
                          ),
                          Text(
                            'Sound',
                            style: GoogleFonts.rubik(
                              fontSize: 20,
                              color: DuckDuckColors.steelBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              DuckDuckStatus.disabledForeground,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      'Uploaded Sound',
                                      style: GoogleFonts.rubik(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: DuckDuckColors.steelBlack,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 52, // Set the desired height
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          side: MaterialStateProperty.all(
                                            const BorderSide(
                                              color: DuckDuckColors.skyBlue,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Upload'),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              Icons.cloud_upload,
                                              size: 32,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SoundRadioList(
                                value: value,
                                groupValue: groupValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    groupValue = newValue ?? "";
                                  });
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: DuckDuckStatus.disabledForeground,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  'Present',
                                  style: GoogleFonts.rubik(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: DuckDuckColors.steelBlack,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SoundRadioList(
                          value: value,
                          groupValue: groupValue2,
                          onChanged: (String? newValue) {
                            setState(() {
                              groupValue2 = newValue ?? "";
                            });
                          }),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: DuckDuckStatus.disabledForeground,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //AlarmDialogBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
