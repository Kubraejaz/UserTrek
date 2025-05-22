import 'package:flutter/material.dart';
import 'package:usertrek/constants/colors.dart';
import 'package:usertrek/widget/forget_password_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const ForgetPasswordWidget(),
    );
  }
}
