import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_parts_hub/domain/core/entities/chat_entities/message_entity.dart';

class MessageModel extends MessageEntity {
  MessageModel({
    required super.senderId,
    required super.recieverId,
    required super.message,
    required super.messageSeen,
    required super.timestamp,
  });

  MessageModel copyWith({
    String? senderId,
    String? recieverId,
    String? message,
    bool? messageSeen,
    Timestamp? timestamp,
  }) {
    return MessageModel(
      senderId: senderId ?? this.senderId,
      recieverId: recieverId ?? this.recieverId,
      message: message ?? this.message,
      messageSeen: messageSeen ?? this.messageSeen,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'recieverId': recieverId,
      'message': message,
      'messageSeen': messageSeen,
      'timestamp': timestamp,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] as String,
      recieverId: map['recieverId'] as String,
      message: map['message'] as String,
      messageSeen: map['messageSeen'],
      timestamp: map['timestamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''MessageModel(senderId: $senderId, recieverId: $recieverId, message: 
              $message, messageSeen: $messageSeen, timestamp: $timestamp)''';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;

    return other.senderId == senderId &&
        other.recieverId == recieverId &&
        other.message == message &&
        other.messageSeen == messageSeen &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return senderId.hashCode ^
        recieverId.hashCode ^
        message.hashCode ^
        messageSeen.hashCode ^
        timestamp.hashCode;
  }
}
