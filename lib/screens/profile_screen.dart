import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usertrek/constants/colors.dart';
import 'package:usertrek/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    final userModel =
        ModalRoute.of(context)?.settings.arguments as UserModel?;

    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: AppColors.textWhite),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.textWhite),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                userModel?.avatarPath ?? 'assets/images/avatar.png',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              userModel?.account ?? _auth.currentUser?.email ?? 'User',
              style: const TextStyle(
                color: AppColors.textWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                userModel?.about ?? 'Welcome to your profile!',
                style: const TextStyle(
                  color: AppColors.textWhite70,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
