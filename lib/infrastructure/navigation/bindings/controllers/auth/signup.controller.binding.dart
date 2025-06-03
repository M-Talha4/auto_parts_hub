import '/infrastructure/dal/services/firebase_services/auth_services.dart';
import '/presentation/auth/signup/controllers/signup.controller.dart';
import '/domain/core/interfaces/auth_interface/auth_repository.dart';
import '/domain/core/usecase/auth_usecase/signup_usecase.dart';
import '/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import 'package:get/get.dart';

import '../../../../dal/services/firebase_services/notification_services.dart';

class SignupControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthDao(Get.find<AuthServices>(), Get.find<NotificationServices>()),
    );
    Get.lazyPut<SignupUsecase>(
      () => SignupUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(Get.find<SignupUsecase>()),
    );
  }
}
