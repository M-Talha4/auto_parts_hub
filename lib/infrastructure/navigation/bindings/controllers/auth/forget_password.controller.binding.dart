import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/forget_password_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/presentation/auth/forget_password/controllers/forget_password.controller.dart';
import 'package:get/get.dart';

class ForgetPasswordControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthDao(Get.find<AuthServices>()),
    );
    Get.lazyPut<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<ForgetPasswordController>(
      () => ForgetPasswordController(Get.find<ForgetPasswordUsecase>()),
    );
  }
}
