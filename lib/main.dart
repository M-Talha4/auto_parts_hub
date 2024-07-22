import 'package:auto_parts_hub/domain/const/static_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'infrastructure/theme/theme.dart';
import 'generated/locales.generated.dart';
import 'package:get_storage/get_storage.dart';
import 'infrastructure/navigation/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'infrastructure/navigation/navigation.dart';
import 'package:auto_parts_hub/firebase_options.dart';
import 'package:auto_parts_hub/domain/const/global_variable.dart';
import 'package:auto_parts_hub/infrastructure/theme/imports.dart';
import 'infrastructure/dal/services/bindings/service_bindings.dart';
import 'package:auto_parts_hub/infrastructure/dal/services/language_services/language_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      translationsKeys: AppTranslation.translations,
      theme: AppTheme.instance.light,
      darkTheme: AppTheme.instance.dark,
      themeMode: getTheme(),
      locale: getLanguage(),
      initialRoute: initialRoute,
      getPages: Nav.routes,
      initialBinding: ServiceBindings(),
    );
  }
}

Locale getLanguage() {
  return LanguageServices.instance
      .onLanguageSelected(GetStorage().read('language').toString());
}

ThemeMode getTheme() {
  bool? isDarkMode = GetStorage().read('isDarkTheme');
  if (isDarkMode != null) {
    if (isDarkMode) {
      StaticData.isDarkMode = isDarkMode;
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  } else {
    return ThemeMode.system;
  }
}
