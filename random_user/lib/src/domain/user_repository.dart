import 'package:random_user/src/data/models/user_model.dart';

abstract class UserRepository {
  Future<void> saveUser(UserModel user);
  Future<void> deleteUser(UserModel user);
  Future<UserModel> getRandomUser();
  Future<List<UserModel>> getSavedUsers();

}