import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

abstract class MessageEntity {
  final String _senderId;
  final String _recieverId;
  final String _message;
  final bool _messageSeen;
  final Timestamp _timestamp;

  MessageEntity({
    required String senderId,
    required String recieverId,
    required String message,
    required bool messageSeen,
    required Timestamp timestamp,
  })  : _senderId = senderId,
        _recieverId = recieverId,
        _message = message,
        _messageSeen = messageSeen,
        _timestamp = timestamp;

  String get senderId => _senderId;
  String get recieverId => _recieverId;
  String get message => _message;
  bool get messageSeen => _messageSeen;
  Timestamp get timestamp => _timestamp;
}
