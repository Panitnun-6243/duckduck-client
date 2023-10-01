import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/login/signup_click.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).size.height * 0.16;
    double bottomPadding = MediaQuery.of(context).size.height * 0.04;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login_bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(
                top: topPadding, left: 36, right: 36, bottom: bottomPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome\nBack',
                    style: GoogleFonts.rubik(
                        fontSize: 44,
                        fontWeight: FontWeight.w600,
                        color: DuckDuckColors.cocoa),
                  ),
                ),
                const Text('textfield'),
                const SignUpClick()
              ],
            ),
          )),
    );
  }
}
