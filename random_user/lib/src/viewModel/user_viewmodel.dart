import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:random_user/src/data/models/user_model.dart';

import 'package:random_user/src/domain/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository repository;

  UserViewModel({required this.repository});
  List<UserModel> users = [];
  List<UserModel> savedUsers = [];
  bool isLoading = false;
  String? error;

  Ticker? _ticker;
  Duration _elapsed = Duration.zero;

  void startTicker(TickerProvider vsync) {
    _ticker = vsync.createTicker((elapsed) async {
      if (elapsed - _elapsed >= const Duration(seconds: 5)) {
        _elapsed = elapsed;
        await getUser();
      }
    });

    _ticker!.start();
  }

  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();

    try {
      final user = await repository.getRandomUser();
      users.add(user);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  Future<void> loadSavedUsers() async {
    savedUsers = await repository.getSavedUsers();
    notifyListeners();
  }

  Future<void> saveUser(UserModel user) async {
    try {
      await repository.saveUser(user);
      savedUsers.add(user);
    } catch (e) {
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteSavedUser(UserModel user) async {
    try {
      await repository.deleteUser(user);
    } catch (e) {
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

   bool isUserSaved(UserModel user) {
    return savedUsers.any((u) => u.login.uuid == user.login.uuid);
  }
}
