import '../firebase_services/user_services.dart';
import '/domain/notifications/firebase_push_notifications/firebase_push_notifications.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/infrastructure/dal/services/firebase_services/chat_service.dart';
import '/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

import '../firebase_services/notification_services.dart';
import '../firebase_services/remote_config_services.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserServices>(() => UserServices());
    Get.lazyPut<FireStoreServices>(() => FireStoreServices());
    Get.lazyPut<AuthServices>(
        () => AuthServices(Get.find<FireStoreServices>()));
    Get.lazyPut<ChatService>(() => ChatService());
    Get.lazyPut<FirebaseStorageService>(() => FirebaseStorageService());
    Get.lazyPut<RemoteConfigServices>(() => RemoteConfigServices());
    Get.lazyPut<NotificationServices>(() => NotificationServices(
        Get.find<RemoteConfigServices>(), FirebasePushNotifications()));
  }
}
