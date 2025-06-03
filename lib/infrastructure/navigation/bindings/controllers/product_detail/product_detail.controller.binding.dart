import '/domain/core/interfaces/cart_interface/cart_repository.dart';
import '/domain/core/usecase/cart_usecase/add_to_cart_usecase.dart';
import '/infrastructure/dal/daos/cart_dao/cart_dao.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import 'package:get/get.dart';
import '../../../../../presentation/dashboard/product_detail/controllers/product_detail.controller.dart';

class ProductDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartRepository>(
      () => CartDao(Get.find<FireStoreServices>()),
    );
    Get.lazyPut<AddToCartUsecase>(
      () => AddToCartUsecase(Get.find<CartRepository>()),
    );
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(Get.find<AddToCartUsecase>()),
    );
  }
}
