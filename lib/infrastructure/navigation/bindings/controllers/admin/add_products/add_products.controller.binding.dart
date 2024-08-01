import 'package:auto_parts_hub/domain/core/interfaces/product_interdace/products_repository.dart';
import 'package:auto_parts_hub/domain/core/usecase/products_usecase/add_product_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/products_usecase/update_product_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/products_usecase/upload_product_image_usecase.dart';
import 'package:auto_parts_hub/infrastructure/dal/daos/product_dao/product_dao.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firebase_storage_service.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';

import '../../../../../../presentation/admin_panel/modules/add_products/controllers/add_products.controller.dart';

class AddProductsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepository>(() => ProductDao(
        Get.find<FireStoreServices>(), Get.find<FirebaseStorageService>()));
    Get.lazyPut<UploadProductImageUsecase>(
        () => UploadProductImageUsecase(Get.find<ProductsRepository>()));
    Get.lazyPut<UpdateProductUsecase>(
        () => UpdateProductUsecase(Get.find<ProductsRepository>()));
    Get.lazyPut<AddProductUsecase>(
        () => AddProductUsecase(Get.find<ProductsRepository>()));
    Get.lazyPut<AddProductsController>(() => AddProductsController(
        Get.find<UploadProductImageUsecase>(),
        Get.find<AddProductUsecase>(),
        Get.find<UpdateProductUsecase>()));
  }
}
