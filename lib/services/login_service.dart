// services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tax_advisory_app/sessions/session_manager.dart';

import '../models/auth_response.dart';


class LoginService {
  static Future<AuthResponse> loginUser(
      String phoneNumber,
      String password,
      ) async {

    var response = await http.post(Uri.parse('http://172.17.20.221:9091/api/auth/login'),
        headers:{
          'Content-Type': 'application/json',
        },
        body:jsonEncode({
          "phoneNumber": phoneNumber,
          "password": password,
        })
    );
    print("Oya");
    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      SessionManager.saveAccessToken(data["access_token"]);
      SessionManager.saveLoggedIn(true);
      print(data["access_token"]);
      return AuthResponse.fromJson(data);
    } else {
      return throw Exception("Umezingua");
    }
  }


}