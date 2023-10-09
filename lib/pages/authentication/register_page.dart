import 'package:flutter/material.dart';

import '../../widgets/login/custom_textform.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register-bg.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // CustomTextForm(
                //     controller: _emailController,
                //     focusNode: _emailNode,
                //     hintText: 'Email',
                //     textInputAction: TextInputAction.next,
                //     onSubmitted: (_) =>
                //         FocusScope.of(context).requestFocus(_passwordNode)),
                // const SizedBox(
                //   height: 15,
                // ),
                // CustomTextForm(
                //   controller: _passwordController,
                //   focusNode: _passwordNode,
                //   hintText: 'Password',
                //   icon: Icons.lock_rounded,
                //   obscureText: true,
                // ),
              ],
            ),
          ),
        ));
  }
}
