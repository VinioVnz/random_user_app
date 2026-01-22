import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/src/app/app.dart';
import 'package:random_user/src/data/local/user_local_storage.dart';
import 'package:random_user/src/data/repositories/user_repository_impl.dart';
import 'package:random_user/src/data/services/user_api_service.dart';
import 'package:random_user/src/viewModel/user_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserViewModel(
        repository: UserRepositoryImpl(service: UserApiService(), local: UserLocalStorage()),
      ),
      child: const MyApp(),
    ),
  );
}
