import 'package:auto_parts_hub/domain/core/interfaces/chat_interface/chat_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/chat_usecase.dart/get_message_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/chat_usecase.dart/send_message_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/chat_dao/chat_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/chat_service.dart';
import 'package:get/get.dart';

import '../../../../../presentation/chat_list/chat/controllers/chat.controller.dart';

class ChatControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRepository>(
        () => ChatDao(Get.find<ChatService>(), Get.find<AuthServices>()));
    Get.lazyPut<GetMessageUsecase>(
        () => GetMessageUsecase(Get.find<ChatRepository>()));
    Get.lazyPut<SendMessageUsecase>(
        () => SendMessageUsecase(Get.find<ChatRepository>()));
    Get.lazyPut<ChatController>(() => ChatController(
        Get.find<GetMessageUsecase>(), Get.find<SendMessageUsecase>()));
  }
}
