import 'package:duckduck/widgets/login/custom_textform.dart';
import 'package:duckduck/widgets/register/back_login_button.dart';
import 'package:flutter/material.dart';
import 'package:duckduck/widgets/authen_button.dart';

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

  @override
  void dispose() {
    super.dispose();
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
    double topPadding = MediaQuery.of(context).size.height * 0.18;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/register-bg.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 60,
              left: 23,
              child: BackLoginButton(
                text: 'Login',
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: topPadding,
                left: 36,
                right: 36,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        height: 15,
                      ),
                      CustomTextForm(
                        controller: _nameController,
                        focusNode: _nameNode,
                        hintText: 'Name',
                        icon: Icons.account_circle_rounded,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextForm(
                        controller: _deviceCodeController,
                        focusNode: _deviceCodeNode,
                        hintText: 'Device Code',
                        icon: Icons.qr_code,
                      ),
                      const SizedBox(
                        height: 15,
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
          ],
        ),
      ),
    );
  }
}
