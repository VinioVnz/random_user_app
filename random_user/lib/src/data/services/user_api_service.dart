import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user/src/data/models/user_model.dart';

class UserApiService {
  final String baseUrl = 'https://randomuser.me/api/';

  Future<UserModel> getRandomUser() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar random user: ${response.statusCode}');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    return UserModel.fromJson(data['results'][0]);
  }
}
