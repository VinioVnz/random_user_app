class LoginModel {
  final String uuid;
  final String username;
  final String password;

  LoginModel({
    required this.uuid,
    required this.username,
    required this.password
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      uuid: json['uuid'],
      username: json['username'],
      password: json['password']
    );
  }
}