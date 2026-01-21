import 'package:flutter/material.dart';
import 'package:random_user/src/data/models/user_model.dart';

import 'package:random_user/src/domain/user_repository.dart';

class UserViewModel extends ChangeNotifier{
  final UserRepository repository;

  UserViewModel({required this.repository});

  UserModel? user;
  bool isLoading = false;
  String? error;

  Future<void> getUser() async{
    isLoading = true;
    notifyListeners();
    
    try {
      user = await repository.getRandomUser();
    } catch (e) {
      error = e.toString();
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }
}