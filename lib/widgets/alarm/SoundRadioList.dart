import 'package:flutter/material.dart';

class SoundRadioList extends StatefulWidget {
  final value;
  final groupValue;
  final Function onChanged;
  const SoundRadioList(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  State<SoundRadioList> createState() => _SoundRadioListState();
}

class _SoundRadioListState extends State<SoundRadioList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<String>(
            title: const Text('Radial'),
            value: "Radial",
            groupValue: widget.groupValue,
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            }),
        RadioListTile<String>(
            title: const Text('Arpeggio'),
            value: "Arpeggio",
            groupValue: widget.groupValue,
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            }),
        RadioListTile<String>(
            title: const Text('Classic'),
            value: "Classic",
            groupValue: widget.groupValue,
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            }),
        RadioListTile<String>(
            title: const Text('Classic'),
            value: "Classic",
            groupValue: widget.groupValue,
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            }),
        RadioListTile<String>(
            title: const Text('Classic'),
            value: "Classic2",
            groupValue: widget.groupValue,
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            }),
        RadioListTile<String>(
            title: const Text('Classic'),
            value: "Classic",
            groupValue: widget.groupValue,
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            }),
        RadioListTile<String>(
            title: const Text('Classic'),
            value: "Classic",
            groupValue: widget.groupValue,
            onChanged: (String? newValue) {
              widget.onChanged(newValue);
            }),
      ],
    );
  }
}
