import 'package:flutter/material.dart';
import 'package:usertrek/constants/colors.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 120),
          const SizedBox(height: 12),
          const Text(
            'UserTrek',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textWhite,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Explore Yourself',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textWhite70,
            ),
          ),
        ],
      ),
    );
  }
}
