import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/presentation/auth/signup/controllers/signup.controller.dart';
import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/signup_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import 'package:get/get.dart';

class SignupControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthDao(Get.find<AuthServices>()),
    );
    Get.lazyPut<SignupUsecase>(
      () => SignupUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<SignupController>(
      () => SignupController(Get.find<SignupUsecase>()),
    );
  }
}
