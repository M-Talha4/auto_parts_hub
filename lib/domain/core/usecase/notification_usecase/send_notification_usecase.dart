import '../../entities/notification_entities/notification_entity.dart';
import '../../interfaces/notification_interface/notification_repository.dart';

class SendNotificationUsecase {
  final NotificationRepository _notificationRepository;
  SendNotificationUsecase(this._notificationRepository);

  Future<void> execute(NotificationEntity notification) {
    return _notificationRepository.sendNotification(notification);
  }
}
