import '/utils/sharepreference_helper.dart';
import 'package:get/get.dart';
import 'consts/app_color.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'consts/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.initialize();
  runApp(
    SafeArea(
      child: GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: AppColor.primary,
                iconTheme: IconThemeData(color: AppColor.white),
                titleTextStyle:
                    TextStyle(fontSize: 26, fontWeight: FontWeight.w500))),
        // initialRoute: Routes.LOGIN,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
