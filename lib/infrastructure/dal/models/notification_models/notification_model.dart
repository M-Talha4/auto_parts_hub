import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/core/entities/notification_entities/notification_entity.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends NotificationEntity {
  @override
  @JsonKey(name: 'fcmToken', defaultValue: '')
  String fcmToken;

  @override
  @JsonKey(name: 'notification')
  NotificationBodyModel notification;

  NotificationModel({
    required this.fcmToken,
    required this.notification,
  }) : super(fcmToken: fcmToken, notification: notification);

  // CopyWith method
  NotificationModel copyWith({
    String? fcmToken,
    NotificationBodyModel? notification,
  }) {
    return NotificationModel(
      fcmToken: fcmToken ?? this.fcmToken,
      notification: notification ?? this.notification,
    );
  }

  // Equals method
  bool eqauls(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationModel &&
        other.fcmToken == fcmToken &&
        other.notification == notification;
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

@JsonSerializable()
class NotificationBodyModel extends NotificationBodyEntity {
  @override
  @JsonKey(name: 'title', defaultValue: '')
  String title;

  @override
  @JsonKey(name: 'body', defaultValue: '')
  String body;

  NotificationBodyModel({
    required this.title,
    required this.body,
  }) : super(title: title, body: body);

  // CopyWith method
  NotificationBodyModel copyWith({
    String? title,
    String? body,
  }) {
    return NotificationBodyModel(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  // Equals method
  bool equals(Object other) {
    return other is NotificationBodyModel &&
        other.title == title &&
        other.body == body;
  }

  factory NotificationBodyModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationBodyModelToJson(this);
}
