import 'dart:async';
import 'package:get/get.dart';
import '../../../infrastructure/dal/services/firebase_services/user_services.dart';
import '/infrastructure/navigation/routes.dart';
import '../../../domain/core/usecase/users_usecase/get_current_user_usecase.dart';

class SplashController extends GetxController {
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  SplashController(this._getCurrentUserUsecase);

  @override
  onInit() {
    getUserConfig();
    super.onInit();
  }

  Future<void> getUserConfig() async {
    await _getCurrentUserUsecase.execute();
    var user = Get.find<UserServices>().user.value;
    if (user.userId.isEmpty) {
      Get.offNamed(Routes.LOGIN);
    } else {
      user.isAdmin == true
          ? Get.offNamed(Routes.ADMIN_PANEL)
          : Get.offNamed(Routes.HOME);
    }
  }
}
