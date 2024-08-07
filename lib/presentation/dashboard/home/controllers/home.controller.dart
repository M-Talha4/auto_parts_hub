import 'package:auto_parts_hub/domain/const/assets_paths.dart';
import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:auto_parts_hub/domain/core/entities/product_entities/product.dart';
import 'package:auto_parts_hub/domain/core/usecase/auth_usecase/logout_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/products_usecase/get_products_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/home_usecase/search_product_usecase.dart';
import 'package:auto_parts_hub/domain/core/usecase/users_usecase/check_account_deletion_usecase.dart';
import 'package:auto_parts_hub/domain/db/local_storage/my_prefs.dart';
import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:auto_parts_hub/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LogoutUsecase _logoutUsecase;
  final GetProductsUsecase _getProductsUsecase;
  final SearchProductUsecase _searchProductUsecase;
  final CheckAccountDeletionUsecase _checkAccountDeletionUsecase;
  HomeController(this._getProductsUsecase, this._searchProductUsecase,
      this._logoutUsecase, this._checkAccountDeletionUsecase);

  final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  RxInt currentIndex = 0.obs;
  RxBool isSearching = false.obs;
  RxString query = ''.obs;
  List<Product> productList = [];
  RxList<Product> finalList = RxList.empty();

  List<String> carouselImages = [
    ImagePath.catEnginesImage,
    ImagePath.catHeadlightsImage,
    ImagePath.catRimsImage,
    ImagePath.catTiresImage,
  ];
  List<String> carouselTitles = [
    LocaleKeys.home_engines_text,
    LocaleKeys.home_headlights_text,
    LocaleKeys.home_rims_text,
    LocaleKeys.home_tires_text,
  ];
  List<String> carouselTitlesEnglish = [
    'Engines',
    'Headlights',
    'Rims',
    'Tires',
  ];

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

  @override
  void onInit() {
    getProducts();
    checkForDeletion();
    debounce(
        query,
        time: const Duration(milliseconds: 300),
        (query) => searchFor(query));
    super.onInit();
  }

  Future<void> getProducts() async {
    try {
      productList = await _getProductsUsecase.execute() ?? [];
      productList.shuffle();
      finalList.value = productList;
    } catch (e) {
      if (e is AppException) {
        showSnackbar(message: e.message!, icon: e.icon, isError: true);
      } else {
        Logger.e(e.toString());
      }
    }
  }

  void onSearchOff() {
    finalList.value = productList;
    isSearching.value = false;
  }

  void searchFor(String query) {
    if (query.isNotEmpty) {
      finalList.value =
          _searchProductUsecase.execute(query.trim().toLowerCase());
    } else {
      finalList.value = productList;
    }
  }

  void notificationDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(LocaleKeys.dialog_feature_coming_soon_text.tr),
        content: Text(LocaleKeys
            .dialog_this_feature_will_be_implemented_in_later_releases.tr),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(LocaleKeys.dialog_ok_text.tr),
          ),
        ],
      ),
    );
  }

  Future<void> checkForDeletion() async {
    try {
      await _checkAccountDeletionUsecase.execute(StaticData.userId);
    } catch (e) {
      confirmLogout(Get.context!, StaticData.userId);
    }
  }

  Future<void> confirmLogout(BuildContext context, String userId) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${LocaleKeys.drawer_logout_text.tr}!!'),
          content: Text(LocaleKeys.exception_you_have_been_banned.tr),
          actions: <Widget>[
            CustomButton(onTap: logout, text: LocaleKeys.drawer_logout_text.tr)
          ],
        );
      },
    );
  }

//------------------------------ Drawer-------------------------

  void onTapDrawerItem(String screen) {
    switch (screen) {
      case LocaleKeys.drawer_profile_text:
        Get.toNamed(Routes.PROFILE);
        break;
      case LocaleKeys.drawer_my_cart_text:
        Get.back();
        Get.toNamed(Routes.MY_CART);
        break;
      case LocaleKeys.drawer_my_orders_text:
        Get.toNamed(Routes.MY_ORDERS);
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
