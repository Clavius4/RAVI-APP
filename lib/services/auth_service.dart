// lib/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tax_advisory_app/models/user_model.dart';

class AuthService {
  static const String baseUrl = 'http://138.68.168.43:9091/api/auth';

  Future<String> register(UserModel user) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('POST', Uri.parse('$baseUrl/register'));
    request.body = json.encode(user.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception('Failed to register: ${response.reasonPhrase}');
    }
  }
}
