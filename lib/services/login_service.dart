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

    var response = await http.post(Uri.parse('http://138.68.168.43:9091/api/auth/login'),
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
      // AuthResponse _authData=jsonDecode(data);
      SessionManager.saveAccessToken(data["access_token"]);
      SessionManager.saveFirstName(data["firstName"]);
      SessionManager.saveLastName(data["lastName"]);
      SessionManager.savePhone(data["phoneNumber"]);
      SessionManager.saveDistrict(data["district"]);
      SessionManager.saveRegion(data["region"]);
      SessionManager.saveOrganizationName(data["organisationName"]);
      SessionManager.saveOrganizationType(data["organisationType"]);
      SessionManager.saveLoggedIn(true);
      SessionManager.saveLoggedIn(true);
      print(data["access_token"]);
      print(data["phoneNumber"]);
      print(data["district"]);
      print(data);
      // print(_authData.lastName);
      return AuthResponse.fromJson(data);
    } else {
      return throw Exception("Umezingua");
    }
  }


}