import 'package:flutter/material.dart';
import 'package:usertrek/constants/colors.dart';
import 'package:usertrek/widget/login_widget.dart';
import 'package:usertrek/models/user_model.dart'; // Make sure you import your UserModel class

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LoginWidget(
          emailController: emailController,
          passwordController: passwordController,
          onLoginPressed: () {
            // Create UserModel with your data (for example, hardcoded or from the controllers)
            final user = UserModel(
              avatarPath: 'assets/images/avatar.png',
              account: emailController.text, // using email input as account
              password: passwordController.text,
              about: 'I am Kubra!', // you can replace this with actual data
            );

            Navigator.pushReplacementNamed(
              context,
              '/profile',
              arguments: user,
            );
          },
          onForgotPasswordPressed: () {
            Navigator.pushNamed(context, '/forget_password');
          },
          onSignUpPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
        ),
      ),
    );
  }
}
