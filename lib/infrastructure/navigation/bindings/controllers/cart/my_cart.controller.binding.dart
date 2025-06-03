import '/domain/core/interfaces/cart_interface/cart_repository.dart';
import '/domain/core/usecase/cart_usecase/delete_cart_item_usecae.dart';
import '/domain/core/usecase/cart_usecase/get_cart_items_usecase.dart';
import '/domain/core/usecase/cart_usecase/update_cart_usecase.dart';
import '/infrastructure/dal/daos/cart_dao/cart_dao.dart';
import '/infrastructure/dal/services/firebase_services/firestore_services.dart';
import '../../../../../presentation/dashboard/my_cart/controllers/my_cart.controller.dart';
import 'package:get/get.dart';

class MyCartControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartRepository>(
      () => CartDao(Get.find<FireStoreServices>()),
    );
    Get.lazyPut<GetCartItemsUsecase>(
      () => GetCartItemsUsecase(Get.find<CartRepository>()),
    );
    Get.lazyPut<UpdateCartUsecase>(
      () => UpdateCartUsecase(Get.find<CartRepository>()),
    );
    Get.lazyPut<DeleteCartItemUsecae>(
      () => DeleteCartItemUsecae(Get.find<CartRepository>()),
    );

    Get.lazyPut<MyCartController>(
      () => MyCartController(Get.find<GetCartItemsUsecase>(),
          Get.find<UpdateCartUsecase>(), Get.find<DeleteCartItemUsecae>()),
    );
  }
}
