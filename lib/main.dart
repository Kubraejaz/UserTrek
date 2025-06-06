import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:usertrek/screens/signup_screen.dart';
import 'package:usertrek/constants/colors.dart';
import 'package:usertrek/screens/splash_screen.dart';
import 'package:usertrek/screens/login_screen.dart';
import 'package:usertrek/screens/forget_password_screen.dart';
import 'package:usertrek/screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const UserTrekApp());
}

class UserTrekApp extends StatelessWidget {
  const UserTrekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UserTrek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        brightness: Brightness.dark,
        fontFamily: 'Segoe UI',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textWhite),
          bodyMedium: TextStyle(color: AppColors.textWhite70),
        ),
        colorScheme: ColorScheme.dark(
          primary: AppColors.primary,
          background: AppColors.background,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forget_password': (context) => const ForgetPasswordScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
