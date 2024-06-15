import 'package:get/get.dart';

import '../controllers/user_app_controller.dart';

class UserAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAppController>(
      () => UserAppController(),
    );
  }
}
