// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      senderId: json['senderId'] as String? ?? '',
      recieverId: json['recieverId'] as String? ?? '',
      message: json['message'] as String? ?? '',
      messageSeen: json['messageSeen'] as bool? ?? false,
      timestamp: MessageModel._timestampFromJson(json['timestamp'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'recieverId': instance.recieverId,
      'message': instance.message,
      'messageSeen': instance.messageSeen,
      'timestamp': MessageModel._timestampToJson(instance.timestamp),
    };
