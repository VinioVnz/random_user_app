import 'package:random_user/src/data/models/user_model.dart';
import 'package:random_user/src/data/services/user_api_service.dart';
import 'package:random_user/src/domain/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService service;

  UserRepositoryImpl({required this.service});
  
  @override
  Future<void> deleteUser(UserModel user) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getRandomUser() async{
    return await service.getRandomUser();
  }

  @override
  Future<List<UserModel>> getSavedUsers() {
    // TODO: implement getSavedUsers
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(UserModel user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
