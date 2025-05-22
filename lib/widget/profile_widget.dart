import 'package:flutter/material.dart';
import 'package:usertrek/constants/colors.dart';
import 'package:usertrek/models/user_model.dart';

class ProfileWidget extends StatefulWidget {
  final UserModel user;

  const ProfileWidget({super.key, required this.user});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late TextEditingController accountController;
  late TextEditingController passwordController;
  late TextEditingController aboutController;

  @override
  void initState() {
    super.initState();
    accountController = TextEditingController(text: widget.user.account);
    passwordController = TextEditingController(text: widget.user.password);
    aboutController = TextEditingController(text: widget.user.about);
  }

  @override
  void dispose() {
    accountController.dispose();
    passwordController.dispose();
    aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Center(
            child: CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage(widget.user.avatarPath),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              widget.user.account,
              style: const TextStyle(
                fontSize: 22,
                color: AppColors.textWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 3),
          const Center(
            child: Text(
              'kubraejaz4@gmail.com',
              style: TextStyle(fontSize: 18, color: AppColors.textWhite70),
            ),
          ),
          const SizedBox(height: 28),

          _buildVerticalEditableField(
            icon: Icons.person,
            label: 'Account',
            controller: accountController,
          ),
          const SizedBox(height: 10),
          _buildVerticalEditableField(
            icon: Icons.lock,
            label: 'Password',
            controller: passwordController,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          _buildVerticalEditableField(
            icon: Icons.info_outline,
            label: 'About',
            controller: aboutController,
          ),
          const SizedBox(height: 18),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Colors.redAccent, size: 20),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildVerticalEditableField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.textWhite, size: 18),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textWhite70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            TextField(
              controller: controller,
              obscureText: obscureText,
              maxLines: 1,
              cursorColor: AppColors.textWhite,
              style: const TextStyle(color: AppColors.textWhite, fontSize: 13),
              decoration: const InputDecoration(
                hintText: '',
                hintStyle: TextStyle(color: AppColors.textWhite70),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 4),
                isDense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
