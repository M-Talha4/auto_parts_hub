import 'dart:async';
import 'dart:io';

import '../../../../domain/core/entities/notification_entities/notification_entity.dart';
import '../../../../domain/core/interfaces/notification_interface/notification_repository.dart';
import '../../../../domain/exceptions/network_exception.dart';
import '../../../../domain/exceptions/time_out_exception.dart';
import '../../models/notification_models/notification_model.dart';
import '../../services/firebase_services/notification_services.dart';

class NotificationDao implements NotificationRepository {
  final NotificationServices _notificationServices;
  NotificationDao(this._notificationServices);

  @override
  Future<void> sendNotification(NotificationEntity notification) async {
    try {
      final notificationModel = notification as NotificationModel;
      await _notificationServices.sendNotification(notificationModel);
    } on SocketException catch (e) {
      throw NetworkException.connectionError(e.message);
    } on TimeoutException catch (e) {
      throw RequestTimeoutException.timeOut(e.message!);
    } catch (e) {
      rethrow;
    }
  }
}
