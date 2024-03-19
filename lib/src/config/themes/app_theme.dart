import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/extensions/material_color_extension.dart';

import '../../core/res/color_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: ColorManager.primary.toMaterialColor(),
      primaryColor: ColorManager.primary,
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
          modalBackgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent),
      scaffoldBackgroundColor: ColorManager.greyBorder,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          foregroundColor: ColorManager.primary,
          minimumSize: const Size(35, 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.transparent,
      ),
      appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.grey),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: Color.fromARGB(255, 69, 46, 46),
      ),
    );
    //   textTheme: TextTheme(
    //     headline1: TextStyle(
    //       fontSize: 24,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.black,
    //     ),
    //     headline2: TextStyle(
    //       fontSize: 22,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.black,
    //     ),
    //     headline3: TextStyle(
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.black,
    //     ),
    //     headline4: TextStyle(
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.black,
    //     ),
    //     headline5: TextStyle(
    //       fontSize: 16,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.black,
    //     ),
    //     headline6: TextStyle(
    //       fontSize: 14,
    //       fontWeight: FontWeight.bold,
    //       color: Colors.black,
    //     ),
    //     bodyText1: TextStyle(
    //       fontSize: 14,
    //       fontWeight: FontWeight.normal,
    //       color: Colors.black,
    //     ),
    //     bodyText2: TextStyle(
    //       fontSize: 12,
    //       fontWeight: FontWeight.normal,
    //       color: Colors.black,
    //     ),
    //   ),
    // );
  }

  static ThemeData get dark {
    return ThemeData();
  }
}
