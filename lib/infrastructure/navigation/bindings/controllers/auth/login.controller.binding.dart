import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/login_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/presentation/auth/login/controllers/login.controller.dart';
import 'package:get/get.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthDao(Get.find<AuthServices>()),
    );
    Get.lazyPut<LoginUsecase>(
      () => LoginUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find<LoginUsecase>()),
    );
  }
}
