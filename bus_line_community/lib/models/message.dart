import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String sender;
  final String text;
  final DateTime sendTime;

  Message({required this.text, required this.sender, required this.sendTime});

  Message.fromJson(Map<String, dynamic> json)
    : this(
        sender: json['sender']! as String,
        text: json['text']! as String,
        sendTime: (json['sendTime']! as Timestamp).toDate(),
      );

  Map<String, Object?> toJson() {
    return {
      'sender': sender,
      'text': text,
      'sendTime' : sendTime.toIso8601String(),
    };
  }

  Map<String, Object?> toObject() {
    return {
      'sender': sender,
      'text': text,
      'sendTime' : sendTime,
    };
  }
}