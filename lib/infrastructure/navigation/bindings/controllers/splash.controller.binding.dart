import 'package:get/get.dart';
import '../../../../domain/core/usecase/users_usecase/get_current_user_usecase.dart';
import '../../../dal/services/firebase_services/user_services.dart';
import '/presentation/splash/controllers/splash.controller.dart';
import '/domain/core/interfaces/splash_interface/splash_repository.dart';
import '/infrastructure/dal/daos/splash_dao/splash_dao.dart';

class SplashControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashRepository>(
      () => SplashDao(Get.find<UserServices>()),
    );

    Get.lazyPut<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(Get.find<SplashRepository>()),
    );
    Get.put<SplashController>(
      SplashController(Get.find<GetCurrentUserUsecase>()),
    );
  }
}
