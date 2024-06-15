// import '../consts/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Themes {
//   /// light Theme
//   static final lightTheme = ThemeData(
//     useMaterial3: false,
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     // primaryColor: AppColor.primary,
//     primarySwatch: Colors.deepPurple,
//     // colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
//     appBarTheme: AppBarTheme(
//         backgroundColor: AppColor.white,
//         elevation: 0,
//         actionsIconTheme: IconThemeData(color: AppColor.black.withOpacity(0.7)),
//         iconTheme: IconThemeData(color: AppColor.black.withOpacity(0.7))),

//     scaffoldBackgroundColor: AppColor.white,

//     /// bottomNavigationBarTheme
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         selectedIconTheme: IconThemeData(color: AppColor.secondary, size: 30),
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//         showUnselectedLabels: true,
//         unselectedItemColor: AppColor.icon),

//     /// floatingActionButtonTheme
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: AppColor.secondary,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),

//     /// cardTheme
//     cardTheme: CardTheme(
//         color: AppColor.white,
//         elevation: 8,
//         shadowColor: AppColor.grey.withOpacity(0.08),
//         surfaceTintColor: AppColor.white),

//     switchTheme: SwitchThemeData(
//         trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
//         trackOutlineWidth: const MaterialStatePropertyAll(0),
//         trackColor: MaterialStatePropertyAll(AppColor.grey.withOpacity(0.2)),
//         thumbColor: const MaterialStatePropertyAll(AppColor.white)),

//     ///tabBarTheme
//     tabBarTheme: const TabBarTheme(
//         indicatorColor: AppColor.secondary,
//         indicatorSize: TabBarIndicatorSize.tab,
//         labelColor: AppColor.secondary,
//         unselectedLabelColor: AppColor.grey),

//     /// bottomSheetTheme
//     bottomSheetTheme:
//         const BottomSheetThemeData(backgroundColor: AppColor.white),

//     /// dividerTheme
//     dividerTheme: const DividerThemeData(thickness: 0.3, color: AppColor.grey),
//   );

//   ///TODO  dark Theme
//   // static final darkTheme = ThemeData.dark().copyWith(
//   //   primaryColor: AppColor.primary,
//   //   colorScheme: ColorScheme.fromSeed(
//   //     seedColor: AppColor.primary,
//   //   ),
//   //
//   //   /// iconTheme
//   //   iconTheme: const IconThemeData(color: AppColor.white),
//   //
//   //   /// appBarTheme
//   //   appBarTheme: const AppBarTheme(
//   //       backgroundColor: Colors.transparent,
//   //       iconTheme: IconThemeData(color: AppColor.white)),
//   //
//   //   /// iconButtonTheme
//   //   iconButtonTheme: const IconButtonThemeData(
//   //       style: ButtonStyle(
//   //     iconColor: MaterialStatePropertyAll(AppColor.white),
//   //   )),
//   //
//   //   /// floatingActionButtonTheme
//   //   floatingActionButtonTheme: FloatingActionButtonThemeData(
//   //       backgroundColor: AppColor.secondary,
//   //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
//   //
//   //   /// bottomNavigationBarTheme
//   //   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//   //       selectedIconTheme: IconThemeData(color: AppColor.secondary, size: 30),
//   //       selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
//   //       showUnselectedLabels: true,
//   //       unselectedItemColor: AppColor.grey),
//   //
//   //   /// bottomSheetTheme
//   //   bottomSheetTheme:
//   //       const BottomSheetThemeData(backgroundColor: Color(0xff101010)),
//   //
//   //   /// dividerTheme
//   //   dividerTheme: const DividerThemeData(thickness: 0.3, color: AppColor.grey),
//   //
//   //   ///Card Theme
//   //   cardTheme: CardTheme(color: AppColor.grey.withOpacity(0.2)),
//   //
//   //   /// tabBarTheme
//   //   tabBarTheme: const TabBarTheme(
//   //       indicatorColor: AppColor.secondary,
//   //       indicatorSize: TabBarIndicatorSize.tab,
//   //       labelColor: AppColor.secondary,
//   //       unselectedLabelColor: AppColor.grey),
//   // );
// }
