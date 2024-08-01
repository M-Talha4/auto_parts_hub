import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';
import 'package:auto_parts_hub/domain/core/interfaces/home_interface/home_repository.dart';
import 'package:auto_parts_hub/domain/core/interfaces/product_interdace/products_repository.dart';
import 'package:auto_parts_hub/domain/core/interfaces/user_management_interface/user_management_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/logout_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/products_usecase/get_products_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/home_usecase/search_product_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/users_usecase/check_account_deletion_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/home_dao/home_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/product_dao/product_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/user_management_dao/user_management_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/chat_service.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

import '../../../../../presentation/dashboard/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(
      () => HomeDao(Get.find<FireStoreServices>()),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthDao(Get.find<AuthServices>()),
    );
    Get.lazyPut<ProductsRepository>(
      () => ProductDao(
          Get.find<FireStoreServices>(), Get.find<FirebaseStorageService>()),
    );
    Get.lazyPut<UserManagementRepository>(
      () => UserManagementDao(Get.find<ChatService>(), Get.find<AuthServices>(),
          Get.find<FireStoreServices>()),
    );
    Get.lazyPut<GetProductsUsecase>(
      () => GetProductsUsecase(Get.find<ProductsRepository>()),
    );
    Get.lazyPut<SearchProductUsecase>(
      () => SearchProductUsecase(Get.find<HomeRepository>()),
    );
    Get.lazyPut<LogoutUsecase>(
      () => LogoutUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<CheckAccountDeletionUsecase>(
      () => CheckAccountDeletionUsecase(Get.find<UserManagementRepository>()),
    );
    Get.lazyPut<HomeController>(() => HomeController(
        Get.find<GetProductsUsecase>(),
        Get.find<SearchProductUsecase>(),
        Get.find<LogoutUsecase>(),
        Get.find<CheckAccountDeletionUsecase>()));
  }
}
