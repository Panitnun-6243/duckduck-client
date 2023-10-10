import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/authen_button.dart';
import 'package:duckduck/widgets/login/custom_textform.dart';
import 'package:duckduck/widgets/login/signup_click.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  bool isSubmitted = false;

  Future<void> handleLogin() async {
    setState(() => isSubmitted = true);
    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, '/home');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).size.height * 0.18;
    double bottomPadding = MediaQuery.of(context).size.height * 0.04;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login-bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(
              left: 36,
              right: 36,
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: topPadding),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          loginSubTitle(),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextForm(
                              controller: _emailController,
                              focusNode: _emailNode,
                              hintText: 'Email',
                              textInputAction: TextInputAction.next,
                              onSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_passwordNode)),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextForm(
                            controller: _passwordController,
                            focusNode: _passwordNode,
                            hintText: 'Password',
                            icon: Icons.lock_rounded,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: AuthenButton(onPressed: handleLogin),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: bottomPadding,
                    right: 0,
                    left: 0,
                    child: const SignUpClick())
              ],
            ),
          )),
    );
  }
}

Widget loginSubTitle() {
  return Padding(
    padding: const EdgeInsets.only(left: 3),
    child: Text(
      'Login',
      style: GoogleFonts.rubik(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: DuckDuckColors.cocoa),
    ),
  );
}
