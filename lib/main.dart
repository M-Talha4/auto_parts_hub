import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'consts/app_color.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
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
  );
}
