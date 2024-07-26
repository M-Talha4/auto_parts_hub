import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class MessageEntity {
  String senderId;
  String recieverId;
  String message;
  bool messageSeen;
  Timestamp timestamp;
  MessageEntity({
    required this.senderId,
    required this.recieverId,
    required this.message,
    required this.messageSeen,
    required this.timestamp,
  });
}
