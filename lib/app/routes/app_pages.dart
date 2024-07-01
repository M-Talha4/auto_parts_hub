import 'package:get/get.dart';

import '../modules/admin_panel/bindings/admin_panel_binding.dart';
import '../modules/admin_panel/views/admin_panel_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/user_app/auth/login/bindings/login_binding.dart';
import '../modules/user_app/auth/login/views/login_view.dart';
import '../modules/user_app/auth/signup/bindings/signup_binding.dart';
import '../modules/user_app/auth/signup/views/signup_view.dart';
import '../modules/user_app/dashboard/bindings/dashboard_binding.dart';
import '../modules/user_app/dashboard/modules/dashboard_drawer/bindings/dashboard_drawer_binding.dart';
import '../modules/user_app/dashboard/modules/dashboard_drawer/views/dashboard_drawer_view.dart';
import '../modules/user_app/dashboard/modules/home/bindings/home_binding.dart';
import '../modules/user_app/dashboard/modules/home/views/home_view.dart';
import '../modules/user_app/dashboard/modules/my_cart/bindings/my_cart_binding.dart';
import '../modules/user_app/dashboard/modules/my_cart/views/my_cart_view.dart';
import '../modules/user_app/dashboard/modules/notifications/bindings/notifications_binding.dart';
import '../modules/user_app/dashboard/modules/notifications/views/notifications_view.dart';
import '../modules/user_app/dashboard/views/dashboard_view.dart';
import '../modules/user_app/select_language/bindings/select_language_binding.dart';
import '../modules/user_app/select_language/views/select_language_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.ADMIN_PANEL,
      page: () => const AdminPanelView(),
      binding: AdminPanelBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_LANGUAGE,
      page: () => const SelectLanguageView(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: _Paths.DASHBOARD_DRAWER,
          page: () => const DashboardDrawerView(),
          binding: DashboardDrawerBinding(),
        ),
        GetPage(
          name: _Paths.NOTIFICATIONS,
          page: () => const NotificationsView(),
          binding: NotificationsBinding(),
        ),
        GetPage(
          name: _Paths.MY_CART,
          page: () => const MyCartView(),
          binding: MyCartBinding(),
        ),
      ],
    ),
  ];
}
