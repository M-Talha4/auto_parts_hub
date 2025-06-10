import '../../../../infrastructure/dal/services/firebase_services/user_services.dart';
import '/domain/core/usecase/cart_usecase/delete_cart_item_usecae.dart';
import '/domain/core/usecase/cart_usecase/get_cart_items_usecase.dart';
import '/domain/core/usecase/cart_usecase/update_cart_usecase.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/logger.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/dal/models/cart_models/cart_model.dart';
import '/infrastructure/dal/models/order_models/order_model.dart';
import '/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class MyCartController extends GetxController {
  final GetCartItemsUsecase _getCartItemsUsecase;
  final UpdateCartUsecase _updateCartUsecase;
  final DeleteCartItemUsecae _deleteCartItemUsecae;
  MyCartController(this._getCartItemsUsecase, this._updateCartUsecase,
      this._deleteCartItemUsecae);

  List<CartModel> items = [];
  RxList<CartModel> cartItems = RxList.empty();
  RxInt amount = 0.obs;
  RxInt discount = 0.obs;
  RxInt totalAmount = 0.obs;
  RxList<int> count = RxList.empty();

  @override
  void onInit() async {
    _getCartItems();
    super.onInit();
  }

  void _getCartItems() async {
    try {
      items = (await _getCartItemsUsecase.execute() ?? []) as List<CartModel>;
      cartItems.value = items;
      for (var item in cartItems) {
        count.add(item.itemCount);
      }
      _getTotalPrice();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
  }

  void increaseItemsCount(index) {
    cartItems[index] =
        cartItems[index].copyWith(itemCount: cartItems[index].itemCount + 1);
    _updateCarItems(cartItems[index].itemId, cartItems[index].itemCount);
    count[index]++;
  }

  void decreaseItemsCount(index) {
    if (cartItems[index].itemCount != 1) {
      cartItems[index] =
          cartItems[index].copyWith(itemCount: cartItems[index].itemCount - 1);

      _updateCarItems(cartItems[index].itemId, cartItems[index].itemCount);
      count[index]--;
    } else {
      _deleteCarItems(cartItems[index].itemId);
      cartItems.removeAt(index);
      count.removeAt(index);
    }
  }

  void _updateCarItems(String itemId, int count) {
    try {
      _updateCartUsecase.execute(itemId, count);
      _getTotalPrice();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
  }

  void _deleteCarItems(String itemId) {
    try {
      _deleteCartItemUsecae.execute(itemId);
      _getTotalPrice();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.error(message: e.toString());
      }
    }
  }

  void _getTotalPrice() {
    amount.value = 0;
    discount.value = 0;
    totalAmount.value = 0;
    for (var i = 0; i < cartItems.length; i++) {
      amount.value += cartItems[i].itemCount * cartItems[i].itemPrice;
    }
    if (amount.value > 80000 && amount.value <= 250000) {
      discount.value = (amount.value * 0.05).round();
    } else if (amount.value > 250000 && amount.value <= 800000) {
      discount.value = (amount.value * 0.1).round();
    } else if (amount.value > 800000) {
      discount.value = (amount.value * 0.15).round();
    }
    totalAmount.value = amount.value - discount.value;
  }

  onTapContinue() {
    if (cartItems.isNotEmpty) {
      OrdersModel ordersModel = OrdersModel(
        orderId: DateTime.now().toString(),
        customerId: Get.find<UserServices>().user.value.userId,
        customerEmail: Get.find<UserServices>().user.value.email,
        orderStatus: 'IN-PROCESS',
        orderPrice: totalAmount.value,
        cartItems: items,
      );
      Get.toNamed(Routes.ADDRESS,
          arguments: {'order': ordersModel, 'amount': amount.value});
    } else {
      showSnackbar(
          message: LocaleKeys.my_cart_cart_is_empty_text.tr, isError: true);
    }
  }
}
