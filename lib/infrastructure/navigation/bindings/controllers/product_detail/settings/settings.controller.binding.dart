import 'package:get/get.dart';

import '../../../../../../presentation/dashboard/settings/controllers/settings.controller.dart';

class SettingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
