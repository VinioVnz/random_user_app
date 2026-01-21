import 'package:random_user/src/data/models/dob_model.dart';
import 'package:random_user/src/data/models/login_model.dart';
import 'package:random_user/src/data/models/name_model.dart';
import 'package:random_user/src/data/models/picture_model.dart';
import 'package:random_user/src/data/models/street_model.dart';

class UserModel {
  final NameModel name;
  final StreetModel street;
  final String email;
  final LoginModel login;
  final DobModel dob;
  final String phone;
  final PictureModel picture;

  UserModel({
    required this.name,
    required this.street,
    required this.email,
    required this.login,
    required this.dob,
    required this.phone,
    required this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: NameModel.fromJson(json['name']),
      street: StreetModel.fromJson(json),
      email: json['email'],
      login: LoginModel.fromJson(json['login']),
      dob: DobModel.fromJson(json['dob']),
      phone: json['phone'],
      picture: PictureModel.fromJson(json['picture']),
    );
  }
}
