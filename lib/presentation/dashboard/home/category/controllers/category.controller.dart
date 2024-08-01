import 'package:auto_parts_hub/domain/const/app_colors.dart';
import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/infrastructure/theme/app_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  ScrollController scrollController = ScrollController();
  String title = Get.arguments['title'];
  String titleEng = Get.arguments['titleEng'];
  String image = Get.arguments['imagePath'];
  Color color = DarkAppColors.transparent;
  Color textBgColor = colorScheme(Get.context).outline.withOpacity(0.5);
  Color iconColor = colorSchemeLight.onPrimary;
  double padding = 0;
  List<Product> products = [];

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
      textBgColor = colorScheme(Get.context).outline.withOpacity(0.5);
      iconColor = colorSchemeLight.onPrimary;
      padding = 0;
      update();
    }
    if (scrollController.position.pixels > 150) {
      color = colorScheme(Get.context).onPrimary;
      textBgColor = DarkAppColors.transparent;
      iconColor = colorScheme(Get.context).primary;
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
