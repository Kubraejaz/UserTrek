import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', height: 110),
          const SizedBox(height: 10),
          const Text(
            'UserTrek',
            style: TextStyle(
              fontSize: 40,
              color: AppColors.textWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
