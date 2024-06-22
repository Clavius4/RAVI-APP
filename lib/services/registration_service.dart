import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tax_advisory_app/models/user_model.dart';

class RegisterService {
  static Future<UserModel> registerUser(
      String phoneNumber,
      String password,
      String firstName,
      String lastName,
      String region,
      String district,
      String organisationType,
      String organisationName,
      ) async {

    var response = await http.post(Uri.parse('http://138.68.168.43:9091/api/auth/register'),
        headers:{
        'Content-Type': 'application/json',
        },
        body:jsonEncode({
          "phoneNumber": phoneNumber,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
          "region": region,
          "district": district,
          "organisationType": organisationType,
          "organisationName": organisationName,
        })
    );
    print("Oya");
    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      return throw Exception("Umezingua");
    }
  }
}