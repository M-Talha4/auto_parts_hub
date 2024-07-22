import 'package:auto_parts_hub/domain/core/interfaces/auth_interface/auth_repository.dart';
import 'package:auto_parts_hub/domain/core/interfaces/home_interface/home_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/logout_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/home_usecase/get_products_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/home_usecase/search_product_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/auth_dao/auth_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/home_dao/home_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/auth_services.dart';
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
    Get.lazyPut<GetProductsUsecase>(
      () => GetProductsUsecase(Get.find<HomeRepository>()),
    );
    Get.lazyPut<SearchProductUsecase>(
      () => SearchProductUsecase(Get.find<HomeRepository>()),
    );
    Get.lazyPut<LogoutUsecase>(
      () => LogoutUsecase(Get.find<AuthRepository>()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<GetProductsUsecase>(),
          Get.find<SearchProductUsecase>(), Get.find<LogoutUsecase>()),
    );
  }
}
