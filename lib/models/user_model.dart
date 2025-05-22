class UserModel {
  final String avatarPath;
  final String account;
  final String password;
  final String about;

  UserModel({
    required this.avatarPath,
    required this.account,
    required this.password,
    required this.about,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
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
