import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:usertrek/models/user_model.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> registerUser({
    required String email,
    required String password,
    required String account,
    required String about,
    String avatarPath = 'assets/images/avatar.png',
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;

      final newUser = UserModel(
        id: uid,
        avatarPath: avatarPath,
        account: account,
        password: password,
        about: about,
      );

      await firestore.collection('Users').doc(uid).set(newUser.toMap());

      // ✅ Send email verification
      await userCredential.user!.sendEmailVerification();

      Get.snackbar(
        'Verification Email Sent',
        'Please check your inbox to verify your email.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Registration Failed',
        e.message ?? 'Unknown error occurred.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Unexpected error: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!credential.user!.emailVerified) {
        await auth.signOut();
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'Email not verified. Please check your inbox.',
        );
      }

      final uid = credential.user!.uid;
      final doc = await firestore.collection('Users').doc(uid).get();

      if (!doc.exists) throw Exception('User data not found.');

      return UserModel.fromFirestore(doc);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
