import 'package:flutter/material.dart';

class WaterWave extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;

  WaterWave(
    this.firstValue,
    this.secondValue,
    this.thirdValue,
    this.fourthValue,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(159, 249, 249, 0.8),
          Color.fromRGBO(231, 254, 254, 0.8),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue - 100)
      ..cubicTo(
          size.width * .4,
          size.height / secondValue - 100,
          size.width * .7,
          size.height / thirdValue - 100,
          size.width,
          size.height / fourthValue - 100)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
