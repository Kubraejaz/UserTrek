import 'package:flutter/material.dart';
import 'package:usertrek/constants/colors.dart'; 

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false, 
        title: Row(
          children: const [
            SizedBox(width: 0), 
            Text(
              'Sign Up',
              style: TextStyle(
                color: AppColors.textWhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', height: 60),
                    const SizedBox(width: 12),
                    const Text(
                      'UserTrek',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

               
                TextField(
                  style: const TextStyle(color: AppColors.textWhite),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.inputFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Name',
                    hintStyle: const TextStyle(color: AppColors.textWhite60),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

              
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: AppColors.textWhite),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.inputFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: AppColors.textWhite60),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

               
                TextField(
                  obscureText: true,
                  style: const TextStyle(color: AppColors.textWhite),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.inputFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: AppColors.textWhite60),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
