import 'package:get/get.dart';
import 'package:auto_parts_hub/presentation/splash/controllers/splash.controller.dart';
import 'package:auto_parts_hub/domain/core/interfaces/splash_interface/splash_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/user_config_usecase/user_config_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/splash_dao/splash_dao.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashRepository>(
      () => SplashDao(),
    );
    Get.lazyPut<UserConfigUsecase>(
      () => UserConfigUsecase(Get.find<SplashRepository>()),
    );
    Get.lazyPut<SplashController>(
      () => SplashController(Get.find<UserConfigUsecase>()),
    );
  }
}
