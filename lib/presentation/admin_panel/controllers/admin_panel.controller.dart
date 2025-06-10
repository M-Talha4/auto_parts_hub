import '/domain/const/assets_paths.dart';
import '/domain/core/usecase/auth_usecase/logout_usecase.dart';
import '/domain/db/local_storage/my_prefs.dart';
import '/domain/exceptions/app_exception.dart';
import '/domain/utils/custom_snackbar.dart';
import '/domain/utils/logger.dart';
import '/generated/locales.generated.dart';
import '/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanelController extends GetxController {
  final LogoutUsecase _logoutUsecase;
  AdminPanelController(this._logoutUsecase);

  final GlobalKey<ScaffoldState> adminPanelScaffoldKey =
      GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();

  List<PanelItem> adminPanelItems = [
    PanelItem(
        title: LocaleKeys.admin_panel_manage_orders_text,
        image: ImagePath.manageOrdersimages),
    PanelItem(
        title: LocaleKeys.admin_panel_manage_users_text,
        image: ImagePath.manageUserimages),
    PanelItem(
        title: LocaleKeys.admin_panel_manage_products_text,
        image: ImagePath.manageProductsimages),
    PanelItem(
        title: LocaleKeys.admin_panel_add_products_text,
        image: ImagePath.manageOrdersimages),
  ];

  List<DrawerItem> drawerItems = [
    DrawerItem(
        title: LocaleKeys.drawer_chat_support_text, icon: Icons.support_agent),
    DrawerItem(
        title: LocaleKeys.drawer_settings_text, icon: Icons.settings_outlined),
    DrawerItem(
        title: LocaleKeys.drawer_profile_text, icon: Icons.person_4_outlined),
  ];
  void onTapPanelItem(String screen) {
    switch (screen) {
      case LocaleKeys.admin_panel_manage_orders_text:
        Get.toNamed(Routes.MANAGE_ORDERS);
        break;
      case LocaleKeys.admin_panel_manage_users_text:
        Get.toNamed(Routes.MANAGE_USERS);
        break;
      case LocaleKeys.admin_panel_manage_products_text:
        Get.toNamed(Routes.MANAGE_PRODUCTS);
        break;
      case LocaleKeys.admin_panel_add_products_text:
        Get.toNamed(Routes.ADD_PRODUCTS);
        break;
      default:
        return;
    }
  }
//------------------------------ Drawer-------------------------

  void onTapDrawerItem(String screen) {
    switch (screen) {
      case LocaleKeys.drawer_profile_text:
        Get.toNamed(Routes.PROFILE);
        break;
      case LocaleKeys.drawer_settings_text:
        Get.toNamed(Routes.SETTINGS);
        break;
      case LocaleKeys.drawer_chat_support_text:
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
        Logger.error(message: e);
      }
    }
  }

  void deletePrefs() {
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

class PanelItem {
  String title;
  String image;
  PanelItem({required this.title, required this.image});
}
