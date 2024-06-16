import 'package:get/get.dart';

import '../modules/admin_panel/bindings/admin_panel_binding.dart';
import '../modules/admin_panel/views/admin_panel_view.dart';
import '../modules/user_app/dashboard/bindings/dashboard_binding.dart';
import '../modules/user_app/dashboard/chat/bindings/chat_binding.dart';
import '../modules/user_app/dashboard/chat/views/chat_view.dart';
import '../modules/user_app/dashboard/home/bindings/home_binding.dart';
import '../modules/user_app/dashboard/home/views/home_view.dart';
import '../modules/user_app/dashboard/profile/bindings/profile_binding.dart';
import '../modules/user_app/dashboard/profile/views/profile_view.dart';
import '../modules/user_app/dashboard/views/dashboard_view.dart';
import '../modules/user_app/auth/login/bindings/login_binding.dart';
import '../modules/user_app/auth/login/views/login_view.dart';
import '../modules/user_app/auth/signup/bindings/signup_binding.dart';
import '../modules/user_app/auth/signup/views/signup_view.dart';
import '../modules/user_app/select_language/bindings/select_language_binding.dart';
import '../modules/user_app/select_language/views/select_language_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

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
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.CHAT,
          page: () => const ChatView(),
          binding: ChatBinding(),
        ),
      ],
    ),
  ];
}
