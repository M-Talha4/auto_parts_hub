import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashControllerBinding(),
    ),
    GetPage(
      name: Routes.LANGUAGE,
      page: () => const LanguageScreen(),
      binding: LanguageControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignupScreen(),
      binding: SignupControllerBinding(),
    ),
    GetPage(
      name: Routes.FORGET_PASSWORD,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.ADMIN_PANEL,
      page: () => const AdminPanelScreen(),
      binding: AdminPanelControllerBinding(),
    ),
    GetPage(
      name: Routes.ALL_CATEGORIES,
      page: () => const AllCategoriesScreen(),
      binding: AllCategoriesControllerBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => const CategoryScreen(),
      binding: CategoryControllerBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsScreen(),
      binding: SettingsControllerBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileScreen(),
      binding: ProfileControllerBinding(),
    ),
    GetPage(
      name: Routes.MY_ORDERS,
      page: () => const MyOrdersScreen(),
      binding: MyOrdersControllerBinding(),
    ),
    GetPage(
      name: Routes.MY_CART,
      page: () => const MyCartScreen(),
      binding: MyCartControllerBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsScreen(),
      binding: NotificationsControllerBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetailScreen(),
      binding: ProductDetailControllerBinding(),
    ),
    GetPage(
      name: Routes.ADDRESS,
      page: () => const AddressScreen(),
      binding: AddressControllerBinding(),
    ),
    GetPage(
      name: Routes.ORDER_PLACED,
      page: () => const OrderPlacedScreen(),
      binding: OrderPlacedControllerBinding(),
    ),
    GetPage(
      name: Routes.PAYMENTS,
      page: () => const PaymentsScreen(),
      binding: PaymentsControllerBinding(),
    ),
    GetPage(
      name: Routes.ADD_ADDRESS,
      page: () => const AddAddressScreen(),
      binding: AddAddressControllerBinding(),
    ),
    GetPage(
      name: Routes.ADD_CARD,
      page: () => const AddCardScreen(),
      binding: AddCardControllerBinding(),
    ),
    GetPage(
      name: Routes.CHAT_LIST,
      page: () => const ChatListScreen(),
      binding: ChatListControllerBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatScreen(),
      binding: ChatControllerBinding(),
    ),
    GetPage(
      name: Routes.MANAGE_ORDERS,
      page: () => const ManageOrdersScreen(),
      binding: ManageOrdersControllerBinding(),
    ),
    GetPage(
      name: Routes.MANAGE_USERS,
      page: () => const ManageUsersScreen(),
      binding: ManageUsersControllerBinding(),
    ),
    GetPage(
      name: Routes.MANAGE_PRODUCTS,
      page: () => const ManageProductsScreen(),
      binding: ManageProductsControllerBinding(),
    ),
    GetPage(
      name: Routes.ADD_PRODUCTS,
      page: () => const AddProductsScreen(),
      binding: AddProductsControllerBinding(),
    ),
  ];
}
