import 'package:auto_parts_hub/domain/core/interfaces/user_management_interface/user_management_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/users_usecase/delete_user_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/users_usecase/get_users_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/user_management_dao/user_management_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/chat_service.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

import '../../../../../../presentation/admin_panel/modules/manage_users/controllers/manage_users.controller.dart';

class ManageUsersControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserManagementRepository>(() => UserManagementDao(
        Get.find<ChatService>(),
        Get.find<AuthServices>(),
        Get.find<FireStoreServices>()));
    Get.lazyPut<GetUsersUsecase>(
        () => GetUsersUsecase(Get.find<UserManagementRepository>()));
    Get.lazyPut<DeleteUserUsecase>(
        () => DeleteUserUsecase(Get.find<UserManagementRepository>()));
    Get.lazyPut<ManageUsersController>(() => ManageUsersController(
        Get.find<GetUsersUsecase>(), Get.find<DeleteUserUsecase>()));
  }
}
