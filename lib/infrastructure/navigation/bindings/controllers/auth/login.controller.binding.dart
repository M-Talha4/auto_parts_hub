import '/domain/core/interfaces/auth_interface/auth_repository.dart';
import '/domain/core/usecase/auth_usecase/login_usecase.dart';
import '/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/presentation/auth/login/controllers/login.controller.dart';
import 'package:get/get.dart';

import '../../../../dal/services/firebase_services/notification_services.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthDao(Get.find<AuthServices>(), Get.find<NotificationServices>()),
    );
    Get.lazyPut<LoginUsecase>(
      () => LoginUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find<LoginUsecase>()),
    );
  }
}
