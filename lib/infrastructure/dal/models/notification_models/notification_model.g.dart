// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      fcmToken: json['fcmToken'] as String? ?? '',
      notification: NotificationBodyModel.fromJson(
          json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'notification': instance.notification,
    };

NotificationBodyModel _$NotificationBodyModelFromJson(
        Map<String, dynamic> json) =>
    NotificationBodyModel(
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationBodyModelToJson(
        NotificationBodyModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
