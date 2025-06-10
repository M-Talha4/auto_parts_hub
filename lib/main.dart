import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'domain/const/global_variable.dart';
import 'domain/db/local_storage/my_prefs.dart';
import 'infrastructure/theme/theme.dart';
import 'generated/locales.generated.dart';
import 'package:get_storage/get_storage.dart';
import 'infrastructure/navigation/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'infrastructure/navigation/navigation.dart';
import '/firebase_options.dart';
import 'infrastructure/dal/services/bindings/service_bindings.dart';
import '/infrastructure/dal/services/language_services/language_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    GetStorage.init(),
  ]);
  var initialRoute = Routes.initialRoute;
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
      .onLanguageSelected(MyPrefs.getLanguage().toString());
}

ThemeMode getTheme() {
  bool? isDarkMode = MyPrefs.getTheme();
  switch (isDarkMode) {
    case null:
      return ThemeMode.system;
    case true:
      return ThemeMode.dark;
    case false:
      return ThemeMode.light;
  }
}
