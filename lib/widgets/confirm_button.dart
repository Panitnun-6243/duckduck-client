import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/wide_button.dart';

class ConfirmButton extends StatelessWidget {
  final String confirmText;
  final String cancelText;
  final Function()? onConfirm;
  final Function()? onCancel;
  final double height;
  final double horizontalPadding;
  final bool disabled;
  final bool isLoading;
  const ConfirmButton(
      {Key? key,
      required this.confirmText,
      this.cancelText = 'Cancel',
      required this.onConfirm,
      required this.onCancel,
      this.height = 100,
      this.horizontalPadding = 50,
      this.disabled = false,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('disabled: $disabled');
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: WideButton(
            height: 45,
            text: cancelText,
            onPressed: onCancel,
            foregroundColor: DuckDuckColors.skyBlue,
            backgroundColor: DuckDuckColors.transparent,
            isElevated: false,
            isBold: false,
          )),
          const SizedBox(width: 20.0),
          Expanded(
              child: WideButton(
                  height: 45,
                  text: confirmText,
                  isBold: true,
                  icon: Icons.check,
                  onPressed: onConfirm,
                  disabled: disabled,
                  isLoading: isLoading)),
        ],
      ),
    );
  }
}
