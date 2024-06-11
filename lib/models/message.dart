class Message {
  final String text;
  final DateTime dateTime;
  final bool isSentByMe; // true if the message is sent by the user, false if received

  Message({required this.text, required this.dateTime, required this.isSentByMe});
}
