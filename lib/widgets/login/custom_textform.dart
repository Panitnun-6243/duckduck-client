import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final int maxLength;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputAction textInputAction;
  final Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  const CustomTextForm(
      {Key? key,
      required this.controller,
      this.maxLength = 50,
      this.hintText = 'Aa',
      this.icon = Icons.email_rounded,
      this.obscureText = false,
      this.textInputAction = TextInputAction.done,
      this.onSubmitted,
      this.focusNode,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      buildCounter: (context,
              {required int currentLength,
              required int? maxLength,
              required bool isFocused}) =>
          null,
      onChanged: ((value) {
        setState(() {});
      }),
      onFieldSubmitted: widget.onSubmitted,
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: Icon(
          widget.icon,
          color: DuckDuckColors.cocoa,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: DuckDuckColors.caramelCheese, width: 1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: DuckDuckStatus.disabledForeground,
        ),
        fillColor: DuckDuckColors.frostWhite,
        filled: true,
        errorStyle:
            GoogleFonts.inter(fontSize: 12.0, color: DuckDuckStatus.error),
        suffixIcon: widget.controller.text.isEmpty
            ? null
            : IconButton(
                onPressed: (() => _clearTextField(widget.controller)),
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black54,
                ),
              ),
      ),
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: DuckDuckColors.steelBlack,
      ),
      cursorColor: DuckDuckColors.steelBlack,
      obscureText: widget.obscureText,
      textInputAction: widget.textInputAction,
    );
  }
}
