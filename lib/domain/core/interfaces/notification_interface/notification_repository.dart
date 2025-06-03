import '../../entities/notification_entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<void> sendNotification(NotificationEntity notification);
}
