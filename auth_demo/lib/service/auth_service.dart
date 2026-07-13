import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class AuthService {
  // login() -> giao tiếp với API Auth
  /*
  * Call API (POST) endpoint: https://dummyjson.com/auth/login
  * Body: username + password
  * Danh sách users xem tại: https://dummyjson.com/users
  * */
  Future<void> login(String username, String password) async {
    final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: jsonEncode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json'}
    );

    // response: {'id': ..., 'username': ...., 'accessToken':....., 'refreshToken': ..... }

    // Token Service -> save
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      User loggedInUser = User.fromJSON(responseJson);

      // save token

    }

  }


  // logout
}