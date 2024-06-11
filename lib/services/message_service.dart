import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tax_advisory_app/sessions/session_manager.dart';
import '../models/message_model.dart';

class MessagingService {
  static Future<MessageResponse?> sendMessage(String message, BuildContext context) async {
    String tk = await SessionManager.getAccessToken();
    var response = await http.get(
      Uri.parse('http://172.17.20.221:9091/api/sms/user?message=$message'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tk',
      },
    );

    print("Oya");
    print(tk);
    print(message);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final responseBody = response.body;
      final decodedResponse = json.decode(responseBody);
      print(decodedResponse);
      return MessageResponse.fromJson(decodedResponse);
    } else {
      print('Failed to send message: ${response.reasonPhrase}');
      return null;
    }
  }
}
