import 'package:flutter/material.dart';
import 'package:usertrek/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 110),
            SizedBox(height: 10),
            Text(
              'UserTrek',
              style: TextStyle(
                fontSize: 40,
                color: AppColors.textWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
