import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testing_flutter_apps/models/login_result.dart';

class UserService {
  Future<LoginResult> login(String username, String password) async {
    final response = await http.post(
        Uri.parse('http://192.168.50.25:3004/login'),
        body: {'username': username, 'password': password});
    if (response.statusCode == 200) {
      return LoginResult.fromJson(jsonDecode(response.body));
    } else {
      return LoginResult.fromJson(jsonDecode(response.body));
    }
  }
}
