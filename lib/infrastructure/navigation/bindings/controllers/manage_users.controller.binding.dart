import 'package:get/get.dart';

import '../../../../presentation/admin_panel/modules/manage_users/controllers/manage_users.controller.dart';

class ManageUsersControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageUsersController>(
      () => ManageUsersController(),
    );
  }
}
