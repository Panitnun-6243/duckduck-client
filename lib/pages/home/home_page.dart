import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: DuckDuckColors.cocoa,
                  child: const Text('Profile caed')),
            ),
            Expanded(
                flex: 4,
                child: Container(
                    width: double.infinity,
                    color: DuckDuckColors.caramelCheese,
                    child: const Text('Duck float on water'))),
          ],
        ),
      ),
    );
  }
}
