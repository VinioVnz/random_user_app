import 'package:random_user/src/data/local/user_local_storage.dart';
import 'package:random_user/src/data/models/user_model.dart';
import 'package:random_user/src/data/services/user_api_service.dart';
import 'package:random_user/src/domain/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService service;
  final UserLocalStorage local;

  UserRepositoryImpl({required this.service, required this.local});
  
  @override
  Future<void> deleteUser(UserModel user) async{
    await local.deleteUser(user.login.uuid);
  }

  @override
  Future<UserModel> getRandomUser() async{
    return await service.getRandomUser();
  }

  @override
  Future<List<UserModel>> getSavedUsers() {
    return local.getUsers();
  }

  @override
  Future<void> saveUser(UserModel user) {
    return local.saveUser(user);
  }
}
