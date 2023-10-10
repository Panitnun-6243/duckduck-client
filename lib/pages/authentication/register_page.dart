import 'package:duckduck/widgets/login/custom_textform.dart';
import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/authen_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _deviceCodeController = TextEditingController();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _deviceCodeNode = FocusNode();
  bool isSubmitted = false;

  Future<void> handleLogin() async {
    setState(() => isSubmitted = true);
    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, '/login');
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _deviceCodeController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _nameNode.dispose();
    _deviceCodeNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).size.height * 0.16;
    double bottomPadding = MediaQuery.of(context).size.height * 0.04;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register-bg.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(
              top: topPadding, left: 36, right: 36, bottom: bottomPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 24.0,
                ),
                label: Text('Login'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: DuckDuckColors.metalBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(67.0))),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextForm(
                        controller: _emailController,
                        focusNode: _emailNode,
                        hintText: 'Email',
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_passwordNode)),
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
                    ),
                    CustomTextForm(
                      controller: _nameController,
                      focusNode: _nameNode,
                      hintText: 'Name',
                      icon: Icons.account_circle_rounded,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                    ),
                    CustomTextForm(
                      controller: _deviceCodeController,
                      focusNode: _deviceCodeNode,
                      hintText: 'Device Node',
                      icon: Icons.qr_code,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
