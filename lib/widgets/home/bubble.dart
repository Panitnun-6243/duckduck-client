import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final void Function()? onTap;

  const BubbleWidget(
      {super.key,
      required this.child,
      required this.width,
      required this.height,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width, // Adjust as per bubble size
        height: height, // Adjust as per bubble size
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/bubble.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
