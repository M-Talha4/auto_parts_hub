import '/domain/core/interfaces/auth_interface/auth_repository.dart';
import '/domain/core/usecase/auth_usecase/forget_password_usecase.dart';
import '/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/presentation/auth/forget_password/controllers/forget_password.controller.dart';
import 'package:get/get.dart';

import '../../../../dal/services/firebase_services/notification_services.dart';

class ForgetPasswordControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthDao(Get.find<AuthServices>(), Get.find<NotificationServices>()),
    );
    Get.lazyPut<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<ForgetPasswordController>(
      () => ForgetPasswordController(Get.find<ForgetPasswordUsecase>()),
    );
  }
}
