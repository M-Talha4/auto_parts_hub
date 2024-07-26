import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/logout_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:get/get.dart';

import '../../../../../presentation/admin_panel/controllers/admin_panel.controller.dart';

class AdminPanelControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthDao(Get.find<AuthServices>()));
    Get.lazyPut<LogoutUsecase>(() => LogoutUsecase(Get.find<AuthRepository>()));
    Get.lazyPut<AdminPanelController>(
        () => AdminPanelController(Get.find<LogoutUsecase>()));
  }
}
