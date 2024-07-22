import 'dart:ui';

import 'package:auto_parts_hub/domain/exceptions/app_exception.dart';
import 'package:auto_parts_hub/domain/utils/custom_snackbar.dart';
import 'package:auto_parts_hub/domain/utils/logger.dart';
import 'package:auto_parts_hub/generated/locales.generated.dart';
import 'package:auto_parts_hub/infrastructure/navigation/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/db/local_storage/my_prefs.dart';

class AdminPanelController extends GetxController {
  void logout() {
    try {
      FirebaseAuth.instance.signOut();
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
