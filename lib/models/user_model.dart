import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id; 
  final String avatarPath;
  final String account;
  final String password;
  final String about;

  UserModel({
    required this.id,
    required this.avatarPath,
    required this.account,
    required this.password,
    required this.about,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      avatarPath: data['avatarPath'] ?? 'assets/images/avatar.png',
      account: data['account'] ?? '',
      password: data['password'] ?? '',
      about: data['about'] ?? '',
    );
  }
  factory UserModel.fromMap(Map<String, dynamic> map, {String id = ''}) {
    return UserModel(
      id: id.isNotEmpty ? id : map['id'] ?? '',
      avatarPath: map['avatarPath'] ?? 'assets/images/avatar.png',
      account: map['account'] ?? '',
      password: map['password'] ?? '',
      about: map['about'] ?? '',
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'avatarPath': avatarPath,
      'account': account,
      'password': password,
      'about': about,
    };
  }
}
