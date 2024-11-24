class UserModel {
  final String userId;
  final String email;
  final String name;
  final String password;
  const UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.password,
  });
  factory UserModel.fromJson(json) {
    return UserModel(
      userId: json['id'],
      email: json['email'],
      name: json['name'],
      password: json['password'],
    );
  }
}
