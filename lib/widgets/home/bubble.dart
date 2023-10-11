import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const BubbleWidget(
      {required this.child, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
