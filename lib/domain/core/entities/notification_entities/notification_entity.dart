abstract class NotificationEntity {
  final String _fcmToken;
  final NotificationBodyEntity _notification;

  const NotificationEntity(
      {required String fcmToken, required NotificationBodyEntity notification})
      : _fcmToken = fcmToken,
        _notification = notification;

  String get fcmToken => _fcmToken;
  NotificationBodyEntity get notification => _notification;
}

class NotificationBodyEntity {
  final String _title;
  final String _body;

  const NotificationBodyEntity({required String title, required String body})
      : _title = title,
        _body = body;

  String get title => _title;
  String get body => _body;
}
