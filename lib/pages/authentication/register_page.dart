import 'package:duckduck/pages/pages.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/login/custom_textform.dart';
import 'package:duckduck/widgets/register/back_login_button.dart';
import 'package:flutter/material.dart';
import 'package:duckduck/widgets/authen_button.dart';
import 'package:provider/provider.dart';

import '../../providers/authentication_provider.dart';
import '../../widgets/snackbar.dart';

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

  String? _validateEmail(String? value) {
    RegExp emailRegex = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$',
        caseSensitive: false);
    if (value == null || value.isEmpty) {
      return 'Required';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    } else if (value.length < 6) {
      return 'At least 6 characters';
    }
    return null;
  }

  Future<void> handleRegistration(context) async {
    setState(() => isSubmitted = true);

    if (!_validateForms()) {
      return DuckDuckSnackbar(
              text: 'Invalid form data. Please check your details.',
              icon: Icons.error,
              accentColor: DuckDuckStatus.error)
          .show(context);
    }

    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    bool success = await authProvider.register(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
        _deviceCodeController.text);

    if (success) {
      DuckDuckSnackbar(
              text: 'Registration successful!',
              icon: Icons.check_circle,
              accentColor: DuckDuckStatus.success)
          .show(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      DuckDuckSnackbar(
              text: 'Registration failed. Please check your details.',
              icon: Icons.error,
              accentColor: DuckDuckStatus.error)
          .show(context);
    }
  }

  bool _validateForms() {
    return _validateEmail(_emailController.text) == null &&
        _validateName(_nameController.text) == null &&
        _validatePassword(_passwordController.text) == null;
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
    double topPadding = MediaQuery.of(context).size.height * 0.20;
    double topButtonPadding = MediaQuery.of(context).size.height * 0.055;

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
              top: topButtonPadding,
              left: 23,
              child: BackLoginButton(
                text: 'Login',
                onPressed: () => Navigator.pop(context),
                bgColor: DuckDuckColors.metalBlue,
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
                          validator: _validateEmail,
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
                        validator: _validatePassword,
                        obscureText: true,
                        onSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(_nameNode),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextForm(
                        controller: _nameController,
                        focusNode: _nameNode,
                        hintText: 'Name',
                        icon: Icons.account_circle_rounded,
                        validator: _validateName,
                        onSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(_deviceCodeNode),
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
                        height: 30,
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: AuthenButton(
                              onPressed: () => handleRegistration(context),
                            ),
                          ),
                        ],
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

  Future<void> _showSuccessDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'SUCCESSFUL!!',
            style: TextStyle(
                color: DuckDuckColors.cocoa, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'You are register successful',
            style: TextStyle(color: DuckDuckColors.cocoa),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: DuckDuckColors.cocoa),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
