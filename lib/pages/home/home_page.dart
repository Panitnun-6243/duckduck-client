import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/home/profile_card.dart';
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
                  child: const Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: ProfileCard(
                      name: 'Tanny',
                      profileImageUrl:
                          'https://miro.medium.com/v2/resize:fit:640/0*ngAthWxOvKZHvsw9',
                    ),
                  )),
            ),
            Expanded(
                flex: 5,
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
