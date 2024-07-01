import '/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import '/consts/const.dart';
import 'package:get/get.dart';

class DashboardDrawerController extends GetxController {
  List<DrawerItem> drawerItems = [
    DrawerItem(title: homeText, icon: Icons.home_outlined),
    DrawerItem(title: profileText, icon: Icons.person_4_outlined),
    DrawerItem(title: myCartText, icon: Icons.shopping_cart_outlined),
    DrawerItem(title: myOrdersText, icon: Icons.list_alt),
    DrawerItem(title: settingsText, icon: Icons.settings_outlined),
  ];
  void onTapDrawerItem(String screen, BuildContext context) {
    switch (screen) {
      case profileText:
        Get.back();
        Get.toNamed(Routes.HOME);
        break;
      case myCartText:
        Get.back();
        Get.toNamed(Routes.MY_CART);
        break;
      case myOrdersText:
        Get.back();
        Get.toNamed(Routes.HOME);
        break;
      case settingsText:
        Get.back();
        Get.toNamed(Routes.HOME);
        break;
      default:
        Get.back();
    }
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem({required this.title, required this.icon});
}
