import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/core/entities/cart_entities/cart.dart';
import 'package:auto_parts_hub/domain/core/usecase/cart_usecase/delete_cart_item_usecae.dart';
import 'package:auto_parts_hub/domain/core/usecase/cart_usecase/get_cart_items_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/cart_usecase/update_cart_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/cart_models/cart_model.dart';
import 'package:auto_parts_hub/infrastructure/dal/models/order_models/order_model.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class MyCartController extends GetxController {
  final GetCartItemsUsecase _getCartItemsUsecase;
  final UpdateCartUsecase _updateCartUsecase;
  final DeleteCartItemUsecae _deleteCartItemUsecae;
  MyCartController(this._getCartItemsUsecase, this._updateCartUsecase,
      this._deleteCartItemUsecae);

  List<Cart> items = [];
  RxList<Cart> cartItems = RxList.empty();
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
      items = await _getCartItemsUsecase.execute() ?? [];
      cartItems.value = items;
      for (var item in cartItems) {
        count.add(item.itemCount);
      }
      _getTotalPrice();
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e.toString());
      }
    }
  }

  void increaseItemsCount(index) {
    cartItems[index].itemCount++;
    _updateCarItems(cartItems[index].itemId, cartItems[index].itemCount);
    count[index]++;
  }

  void decreaseItemsCount(index) {
    if (cartItems[index].itemCount != 1) {
      cartItems[index].itemCount--;
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
        Logger.e(e.toString());
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
        Logger.e(e.toString());
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
          customerId: StaticData.userId,
          customerEmail: StaticData.email,
          orderStatus: 'IN-PROCESS',
          orderPrice: totalAmount.value,
          cartItems: items as List<CartModel>);
      Get.toNamed(Routes.ADDRESS,
          arguments: {'order': ordersModel, 'amount': amount.value});
    } else {
      showSnackbar(
          message: LocaleKeys.my_cart_cart_is_empty_text.tr, isError: true);
    }
  }
}
