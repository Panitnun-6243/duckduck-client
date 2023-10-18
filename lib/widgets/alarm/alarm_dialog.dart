import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:flutter/material.dart';

class AlarmDialog extends StatefulWidget {
  const AlarmDialog({super.key});

  @override
  State<AlarmDialog> createState() => _AlarmDialogState();
}

class _AlarmDialogState extends State<AlarmDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Text('dialog header'),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                        Text('data'),
                      ],
                    ),
                  ),
                ),
                AlarmDialogBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
