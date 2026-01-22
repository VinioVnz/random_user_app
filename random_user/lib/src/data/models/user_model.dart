import 'package:random_user/src/data/models/dob_model.dart';
import 'package:random_user/src/data/models/id_model.dart';
import 'package:random_user/src/data/models/location_model.dart';
import 'package:random_user/src/data/models/login_model.dart';
import 'package:random_user/src/data/models/name_model.dart';
import 'package:random_user/src/data/models/picture_model.dart';
import 'package:random_user/src/data/models/registered_model.dart';
import 'package:random_user/src/data/models/street_model.dart';

class UserModel {
  final String gender;
  final NameModel name;
  final LocationModel location;
  final String email;
  final LoginModel login;
  final DobModel dob;
  final RegisteredModel registered;
  final String phone;
  final String cell;
  final IdModel id;
  final PictureModel picture;
  final String nat;

  UserModel({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      gender: json['gender'],
      name: NameModel.fromJson(json['name']),
      location: LocationModel.fromJson(json['location']),
      email: json['email'],
      login: LoginModel.fromJson(json['login']),
      dob: DobModel.fromJson(json['dob']),
      registered: RegisteredModel.fromJson(json['registered']),
      phone: json['phone'],
      cell: json['cell'],
      id: IdModel.fromJson(json['id']),
      picture: PictureModel.fromJson(json['picture']),
      nat: json['nat'],
    );
  }

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'name': name.toJson(),
        'location': location.toJson(),
        'email': email,
        'login': login.toJson(),
        'dob': dob.toJson(),
        'registered': registered.toJson(),
        'phone': phone,
        'cell': cell,
        'id': id.toJson(),
        'picture': picture.toJson(),
        'nat': nat,
      };
}

