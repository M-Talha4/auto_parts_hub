import 'package:cloud_firestore/cloud_firestore.dart';
import '/domain/core/entities/chat_entities/message_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

// Custom converter to handle Timestamp to String conversion
class TimestampConverter implements JsonConverter<Timestamp, String> {
  const TimestampConverter();

  @override
  Timestamp fromJson(String json) {
    return Timestamp.fromMillisecondsSinceEpoch(int.parse(json));
  }

  @override
  String toJson(Timestamp timestamp) {
    return timestamp.seconds
        .toString(); // Converts to a String representation of the seconds
  }
}

@JsonSerializable()
class MessageModel extends MessageEntity {
  @override
  @JsonKey(name: 'senderId', defaultValue: '')
  final String senderId;

  @override
  @JsonKey(name: 'recieverId', defaultValue: '')
  final String recieverId;

  @override
  @JsonKey(name: 'message', defaultValue: '')
  final String message;

  @override
  @JsonKey(name: 'messageSeen', defaultValue: false)
  final bool messageSeen;

  @override
  @JsonKey(
      name: 'timestamp', fromJson: _timestampFromJson, toJson: _timestampToJson)
  final Timestamp timestamp;

  MessageModel({
    required this.senderId,
    required this.recieverId,
    required this.message,
    required this.messageSeen,
    required this.timestamp,
  }) : super(
          senderId: senderId,
          recieverId: recieverId,
          message: message,
          messageSeen: messageSeen,
          timestamp: timestamp,
        );

  // CopyWith method
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

  bool equals(MessageModel other) {
    return other.senderId == senderId &&
        other.recieverId == recieverId &&
        other.message == message &&
        other.messageSeen == messageSeen &&
        other.timestamp == timestamp;
  }

  // Factory method for json_serializable
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  // toJson method for json_serializable
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  // Custom fromJson and toJson methods for Timestamp
  static Timestamp _timestampFromJson(String timestamp) {
    return Timestamp.fromMillisecondsSinceEpoch(int.parse(timestamp));
  }

  static String _timestampToJson(Timestamp timestamp) {
    return timestamp.seconds.toString();
  }
}
