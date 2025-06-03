import '/domain/core/interfaces/chat_interface/chat_repository.dart';
import '/domain/core/usecase/chat_usecase.dart/get_message_usecase.dart';
import '/domain/core/usecase/chat_usecase.dart/send_message_usecase.dart';
import '/infrastructure/dal/daos/chat_dao/chat_dao.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/infrastructure/dal/services/firebase_services/chat_service.dart';
import 'package:get/get.dart';

import '../../../../../domain/core/interfaces/notification_interface/notification_repository.dart';
import '../../../../../domain/core/usecase/notification_usecase/send_notification_usecase.dart';
import '../../../../../presentation/chat_list/chat/controllers/chat.controller.dart';
import '../../../../dal/daos/notification_dao/notification_dao.dart';
import '../../../../dal/services/firebase_services/notification_services.dart';

class ChatControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRepository>(
        () => ChatDao(Get.find<ChatService>(), Get.find<AuthServices>()));
    Get.lazyPut<NotificationRepository>(
        () => NotificationDao(Get.find<NotificationServices>()));
    Get.lazyPut<GetMessageUsecase>(
        () => GetMessageUsecase(Get.find<ChatRepository>()));
    Get.lazyPut<SendMessageUsecase>(
        () => SendMessageUsecase(Get.find<ChatRepository>()));
    Get.lazyPut<SendNotificationUsecase>(
        () => SendNotificationUsecase(Get.find<NotificationRepository>()));
    Get.lazyPut<ChatController>(() => ChatController(
        Get.find<GetMessageUsecase>(),
        Get.find<SendMessageUsecase>(),
        Get.find<SendNotificationUsecase>()));
  }
}
