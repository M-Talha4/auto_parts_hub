import '/domain/core/interfaces/product_interdace/products_repository.dart';
import '/domain/core/usecase/products_usecase/delete_product_usecase.dart';
import '/domain/core/usecase/products_usecase/get_products_usecase.dart';
import '/infrastructure/dal/daos/product_dao/product_dao.dart';
import '/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

import '../../../../../../presentation/admin_panel/modules/manage_products/controllers/manage_products.controller.dart';

class ManageProductsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepository>(() => ProductDao(
        Get.find<FireStoreServices>(), Get.find<FirebaseStorageService>()));
    Get.lazyPut<GetProductsUsecase>(
        () => GetProductsUsecase(Get.find<ProductsRepository>()));
    Get.lazyPut<DeleteProductUsecase>(
        () => DeleteProductUsecase(Get.find<ProductsRepository>()));
    Get.lazyPut<ManageProductsController>(() => ManageProductsController(
        Get.find<GetProductsUsecase>(), Get.find<DeleteProductUsecase>()));
  }
}
