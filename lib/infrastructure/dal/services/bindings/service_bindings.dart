import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/chat_service.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FireStoreServices>(() => FireStoreServices());
    Get.lazyPut<AuthServices>(() => AuthServices());
    Get.lazyPut<ChatService>(() => ChatService());
  }
}
