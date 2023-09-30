import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1),
        () => Navigator.pushNamed(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DuckDuckColors.caramelCheese,
      body: Center(
        child: Text(
          'DuckDuck',
          style: GoogleFonts.rubik(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: DuckDuckColors.cocoa,
          ),
        ),
      ),
    );
  }
}
