import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/usecase/products_usecase/delete_product_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/products_usecase/get_products_usecase.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageProductsController extends GetxController {
  final GetProductsUsecase _getProductsUsecase;
  final DeleteProductUsecase _deleteProductUsecase;
  ManageProductsController(
    this._getProductsUsecase,
    this._deleteProductUsecase,
  );

  RxList<Product> productsList = RxList.empty();

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    try {
      productsList.value = await _getProductsUsecase.execute() ?? []
        ..sort((a, b) => a.productName.compareTo(b.productName));
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      }
      Logger.e(e);
    }
  }

  Future<void> confirmDeletion(BuildContext context, String productId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.dialog_delete_text.tr),
          content: Text(LocaleKeys
              .dialog_are_you_sure_you_want_to_delete_this_item_text.tr),
          actions: <Widget>[
            TextButton(
              child: Text(LocaleKeys.dialog_no_text.tr),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(LocaleKeys.dialog_yes_text.tr),
              onPressed: () async {
                await deleteProduct(productId);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _deleteProductUsecase.execute(productId);
      productsList.removeWhere((product) => product.productId == productId);
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      }
      Logger.e(e);
    }
  }
}
