import 'package:flutter/material.dart';

import '../services/message_service.dart';




class MessageController {
  final TextEditingController messageController = TextEditingController();

  Future<void> sendMessage(BuildContext context) async {
    final message = messageController.text.trim();

    if (message.isEmpty) {
      _showSnackBar(context, 'Message cannot be empty');
      return;
    }

    final response = await MessagingService.sendMessage(message, context);
    if (response != null) {
      _showSnackBar(context, 'Message sent successfully');
    } else {
      _showSnackBar(context, 'Failed to send message');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
