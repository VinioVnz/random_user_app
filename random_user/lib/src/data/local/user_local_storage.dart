import 'dart:convert';

import 'package:random_user/src/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalStorage {
  
  static const _key = 'saved_users';

  Future<List<UserModel>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return [];

    final List list = jsonDecode(jsonString);
    return list.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsers = await getUsers();

    savedUsers.add(user);

    final jsonList = savedUsers.map((u) => u.toJson()).toList();

    await prefs.setString(_key, jsonEncode(jsonList));
  }

   Future<void> deleteUser(String uuid) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsers = await getUsers();

    savedUsers.removeWhere((u) => u.login.uuid == uuid);

    prefs.setString(
      _key,
      jsonEncode(savedUsers.map((u) => u.toJson()).toList()),
    );
  }
}
