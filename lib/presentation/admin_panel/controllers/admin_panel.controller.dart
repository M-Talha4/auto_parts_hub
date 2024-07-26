import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/logout_usecase.dart';
import 'package:auto_parts_hub/domain/db/local_storage/my_prefs.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanelController extends GetxController {
  final LogoutUsecase _logoutUsecase;
  AdminPanelController(this._logoutUsecase);

  final GlobalKey<ScaffoldState> adminPanelScaffoldKey =
      GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  List<DrawerItem> drawerItems = [
    DrawerItem(title: LocaleKeys.drawer_home_text, icon: Icons.home_outlined),
    DrawerItem(
        title: LocaleKeys.drawer_profile_text, icon: Icons.person_4_outlined),
    DrawerItem(
        title: LocaleKeys.drawer_my_cart_text,
        icon: Icons.shopping_cart_outlined),
    DrawerItem(title: LocaleKeys.drawer_my_orders_text, icon: Icons.list_alt),
    DrawerItem(
        title: LocaleKeys.drawer_settings_text, icon: Icons.settings_outlined),
    DrawerItem(
        title: LocaleKeys.drawer_chat_support_text, icon: Icons.support_agent),
  ];

//------------------------------ Drawer-------------------------

  void onTapDrawerItem(String screen, BuildContext context) {
    switch (screen) {
      case LocaleKeys.drawer_profile_text:
        Get.back();
        Get.toNamed(Routes.PROFILE);
        break;
      case LocaleKeys.drawer_my_cart_text:
        Get.back();
        Get.toNamed(Routes.MY_CART);
        break;
      case LocaleKeys.drawer_my_orders_text:
        Get.back();
        Get.toNamed(Routes.MY_ORDERS);
        break;
      case LocaleKeys.drawer_settings_text:
        Get.back();
        Get.toNamed(Routes.SETTINGS);
        break;
      case LocaleKeys.drawer_chat_support_text:
        Get.back();
        Get.toNamed(Routes.CHAT_LIST);
        break;
      default:
        Get.back();
    }
  }

  Future<void> logout() async {
    try {
      await _logoutUsecase.execute();
      showSnackbar(
        message: LocaleKeys.auth_logged_out_successfully_text.tr,
      );
      deletePrefs();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e.toString());
      }
    }
  }

  void deletePrefs() {
    MyPrefs.removeUser();
    MyPrefs.storeAdmin(isAdmin: false);
    MyPrefs.storeLanguage(
        language: LocaleKeys.select_language_english_language);
    Get.updateLocale(const Locale('en', 'US'));
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem({required this.title, required this.icon});
}
