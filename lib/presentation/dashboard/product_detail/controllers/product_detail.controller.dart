import '/domain/core/entities/product_entities/product_entity.dart';
import '/domain/core/usecase/cart_usecase/add_to_cart_usecase.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/loading_mixin.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/dal/models/cart_models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController with LoadingMixin {
  final AddToCartUsecase _addToCartUsecase;
  ProductDetailController(this._addToCartUsecase);

  TextEditingController searchController = TextEditingController();
  ProductEntity product = Get.arguments;
  RxInt currentIndex = 0.obs;

  addToCart() async {
    setLoading(true);
    CartModel cartItem = CartModel(
      itemId: product.productId,
      itemName: product.productName,
      itemCount: 1,
      itemImage: product.productImage,
      itemPrice: product.productPrice,
    );
    String? success = await _addToCartUsecase.execute(cartItem);
    showSnackbar(
        message: success != null
            ? LocaleKeys.my_cart_item_added_text.tr
            : LocaleKeys.my_cart_item_already_added_text.tr);
    Future.delayed(const Duration(seconds: 1), () => setLoading(false));
  }
}
