import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_advisory_app/services/message_service.dart';
import '../../services/sms_service.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final TextEditingController _messageController = TextEditingController();
  final SmsService smsService = Get.put(SmsService());
  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Colors.grey[100]!
              ],
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    children: [
                      _buildTaxAdvisorySystemStack(context),
                      ...messages.map((message) => _buildMessageContainer(message)).toList(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _buildMessageBar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaxAdvisorySystemStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 337,
        width: double.maxFinite,
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset('assets/images/img_image_296x371.png',
                height: 296, width: 371, alignment: Alignment.topCenter),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 19, bottom: 38),
                child: Text(
                  "Messaging Activities",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMessageContainer(Message message) {
    return Align(
      alignment: message.isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: message.color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: message.isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.isSentByUser ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              message.timestamp,
              style: TextStyle(
                color: message.isSentByUser ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.emoji_emotions_outlined),
            onPressed: () {
              // Add logic to open emoji picker
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              maxLength: 250, // Limiting the input message characters to 250
              decoration: InputDecoration(
                hintText: 'Type your message here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              _promptRoleSelection(context);
            },
          ),
        ],
      ),
    );
  }

  void _promptRoleSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Message Urgency"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Urgent"),
                onTap: () {
                  _sendMessage("Urgent", context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Very Urgent"),
                onTap: () {
                  _sendMessage("Very Urgent", context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Not Urgent"),
                onTap: () {
                  _sendMessage("Not Urgent", context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _sendMessage(String urgency, BuildContext context) async {
    Color messageColor;
    switch (urgency) {
      case "Urgent":
        messageColor = Colors.blueAccent;
        break;
      case "Very Urgent":
        messageColor = Colors.blueGrey;
        break;
      case "Not Urgent":
        messageColor = Colors.lightBlue;
        break;
      default:
        messageColor = Colors.black;
    }

    if (_messageController.text.isNotEmpty &&
        _messageController.text.split(' ').length <= 250) {
      // Display the message on the screen immediately
      setState(() {
        messages.add(Message(
          text: _messageController.text,
          timestamp: _formatTimestamp(DateTime.now()),
          isSentByUser: true,
          urgency: urgency,
          color: messageColor,
        ));
      });

      // Clear the message input field
      String message = _messageController.text;
      _messageController.clear();

      // Send the message using MessagingService
      MessagingService.sendMessage(message, context);

      // Use ScaffoldMessenger to show snack bars
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send message. Please ensure it is within 250 words.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  String _formatTimestamp(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute}";
  }
}

class Message {
  final String text;
  final String timestamp;
  final bool isSentByUser;
  final String urgency;
  final Color color;

  Message({
    required this.text,
    required this.timestamp,
    required this.isSentByUser,
    required this.urgency,
    required this.color,
  });
}
