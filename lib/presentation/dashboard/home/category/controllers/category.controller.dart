import '/domain/utils/context_extensions.dart';

import '/domain/const/app_colors.dart';
import '/domain/core/entities/product_entities/product_entity.dart';
import '/infrastructure/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  ScrollController scrollController = ScrollController();
  String title = Get.arguments['title'];
  String titleEng = Get.arguments['titleEng'];
  String image = Get.arguments['imagePath'];
  Color color = DarkAppColors.transparent;
  Color textBgColor = Get.context!.colorScheme.outline.withAlpha(125);
  Color iconColor = colorSchemeLight.onPrimary;
  double padding = 0;
  List<ProductEntity> products = [];

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    _getProductslist();
    super.onInit();
  }

  void _getProductslist() {
    products = Get.arguments['products']
        .where((product) =>
            product.productCategory.toLowerCase() == titleEng.toLowerCase())
        .toList();
  }

  void _scrollListener() {
    if (scrollController.position.pixels < 150) {
      color = DarkAppColors.transparent;
      textBgColor = Get.context!.colorScheme.outline.withAlpha(125);
      iconColor = colorSchemeLight.onPrimary;
      padding = 0;
      update();
    }
    if (scrollController.position.pixels > 150) {
      color = Get.context!.colorScheme.onPrimary;
      textBgColor = DarkAppColors.transparent;
      iconColor = Get.context!.colorScheme.primary;
      padding = 10;
      update();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }
}
