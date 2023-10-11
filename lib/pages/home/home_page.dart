import 'dart:async';

import 'package:duckduck/widgets/home/profile_card.dart';
import 'package:flutter/material.dart';

import '../../widgets/home/bubble.dart';
import '../../widgets/home/water_wave.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  late AnimationController bubbleOneController;
  late Animation<double> bubbleOneAnimation;

  late AnimationController bubbleTwoController;
  late Animation<double> bubbleTwoAnimation;

  @override
  void initState() {
    super.initState();

    // water wave animation
    firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    firstAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    secondAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    thirdAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    Timer(const Duration(seconds: 2), () {
      firstController.forward();
    });

    Timer(const Duration(milliseconds: 1600), () {
      secondController.forward();
    });

    Timer(const Duration(milliseconds: 800), () {
      thirdController.forward();
    });

    fourthController.forward();
    // water wave animation

    // bubble animation
    bubbleOneController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1900));
    bubbleOneAnimation = Tween<double>(begin: 1.0, end: 5.0).animate(
        CurvedAnimation(parent: bubbleOneController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          bubbleOneController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          bubbleOneController.forward();
        }
      });
    bubbleOneController.forward();

    bubbleTwoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200));
    bubbleTwoAnimation = Tween<double>(begin: 1.0, end: 4.0).animate(
        CurvedAnimation(parent: bubbleTwoController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          bubbleTwoController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          bubbleTwoController.forward();
        }
      });
    bubbleTwoController.forward();

    // bubble animation
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    bubbleOneController.dispose();
    bubbleTwoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Calculate the average height of the wave at its peak
    double avgWaveHeight = ((size.height / firstAnimation.value) +
            (size.height / secondAnimation.value) +
            (size.height / thirdAnimation.value) +
            (size.height / fourthAnimation.value)) /
        4.0;

    // Position of the duck on the wave
    double duckBottomPosition = avgWaveHeight - 42;

    // Duck up-down movement
    double floatEffect = 12 * (secondAnimation.value - 2);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ProfileCard(
                    name: 'Tanny',
                    profileImageUrl:
                        'https://miro.medium.com/v2/resize:fit:640/0*ngAthWxOvKZHvsw9',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  CustomPaint(
                    painter: WaterWave(
                      firstAnimation.value,
                      secondAnimation.value,
                      thirdAnimation.value,
                      fourthAnimation.value,
                    ),
                    child: SizedBox(
                      height: size.height,
                      width: size.width,
                    ),
                  ),
                  Positioned(
                    bottom: duckBottomPosition + floatEffect,
                    left: (size.width / 2) - 80,
                    child: Image.asset('assets/images/float-duck1.png',
                        height: 150),
                  ),
                  Positioned(
                    bottom: avgWaveHeight - 300 + bubbleOneAnimation.value,
                    left: size.width * 0.1, // Adjust as per need
                    child: const BubbleWidget(
                      child: Text('Bubble 1'),
                      width: 120.81219,
                      height: 125,
                    ),
                  ),
                  Positioned(
                    bottom: avgWaveHeight - 256 + bubbleTwoAnimation.value,
                    left: size.width * 0.5, // Adjust as per need
                    child: const BubbleWidget(
                      child: Text('Bubble 2'),
                      width: 150.05077,
                      height: 155,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
