import '/domain/core/interfaces/chat_interface/chat_repository.dart';
import '/domain/core/usecase/chat_usecase.dart/get_chat_list_usecase.dart';
import '/infrastructure/dal/daos/chat_dao/chat_dao.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/infrastructure/dal/services/firebase_services/chat_service.dart';
import 'package:get/get.dart';

import '../../../../../presentation/chat_list/controllers/chat_list.controller.dart';

class ChatListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRepository>(
        () => ChatDao(Get.find<ChatService>(), Get.find<AuthServices>()));
    Get.lazyPut<GetChatListUsecase>(
        () => GetChatListUsecase(Get.find<ChatRepository>()));
    Get.lazyPut<ChatListController>(
        () => ChatListController(Get.find<GetChatListUsecase>()));
  }
}
