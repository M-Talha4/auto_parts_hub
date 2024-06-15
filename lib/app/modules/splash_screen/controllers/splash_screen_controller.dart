import '/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(
        const Duration(seconds: 3), () => Get.offNamed(Routes.USER_APP));
    super.onInit();
  }
}
