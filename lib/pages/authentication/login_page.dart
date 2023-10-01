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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login_bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(
                top: 155, left: 39, right: 39, bottom: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome\nBack',
                    style: GoogleFonts.rubik(
                        fontSize: 46,
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
