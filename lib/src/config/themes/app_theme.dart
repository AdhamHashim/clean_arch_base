import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/extensions/material_color_extension.dart';
import 'package:flutter_base/src/config/res/app_sizes.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../res/color_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: ColorManager.primaryColor.toMaterialColor(),
      primaryColor: ColorManager.primaryColor,
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: ColorManager.whiteColor,
        surfaceTintColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: ColorManager.borderColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorManager.whiteColor,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.greyColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
          foregroundColor: ColorManager.primaryColor,
          minimumSize: Size(AppSize.sW30, AppSize.sH30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.sH0),
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.transparent,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: ColorManager.whiteColor,
      ),
      iconTheme: const IconThemeData(
        color: ColorManager.whiteColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: ColorManager.borderColor,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(Go.navigatorKey.currentContext!).textTheme.copyWith(
              // This Style For AppBar Text
              headlineLarge: TextStyle(
                fontSize: FontSize.s18,
                color: ColorManager.secondryColor,
                fontWeight: FontWeightManager.medium,
              ),
              // This Style For Normal Text With PrimaryColor
              titleLarge: TextStyle(
                fontSize: FontSize.s13,
                color: ColorManager.primaryColor,
              ),
              // This Style For Normal Text With SecondryColor
              titleMedium: TextStyle(
                fontSize: FontSize.s13,
                color: ColorManager.primaryColor,
              ),
              // This Style For Normal Text With ThirdColor
              titleSmall: TextStyle(
                fontSize: FontSize.s13,
                color: ColorManager.primaryColor,
              ),
              // This Style For Hint Text
              bodySmall: TextStyle(
                fontSize: FontSize.s8,
                color: ColorManager.hintTextColor,
              ),
            ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primarySwatch: ColorManagerWithDarkMode.primaryColor.toMaterialColor(),
      primaryColor: ColorManagerWithDarkMode.primaryColor,
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: ColorManagerWithDarkMode.whiteColor,
      ),
      scaffoldBackgroundColor: ColorManagerWithDarkMode.borderColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorManagerWithDarkMode.whiteColor,
        selectedItemColor: ColorManagerWithDarkMode.primaryColor,
        unselectedItemColor: ColorManagerWithDarkMode.greyColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
          foregroundColor: ColorManagerWithDarkMode.primaryColor,
          minimumSize: Size(AppSize.sW30, AppSize.sH30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.sH0,
            ),
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.transparent,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: ColorManagerWithDarkMode.whiteColor,
      ),
      iconTheme: const IconThemeData(
        color: ColorManagerWithDarkMode.whiteColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: ColorManagerWithDarkMode.borderColor,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(Go.navigatorKey.currentContext!).textTheme.copyWith(
              // This Style For AppBar Text
              headlineLarge: TextStyle(
                fontSize: FontSize.s18,
                color: ColorManager.secondryColor,
                fontWeight: FontWeightManager.medium,
              ),
              // This Style For Normal Text With PrimaryColor
              titleLarge: TextStyle(
                fontSize: FontSize.s13,
                color: ColorManager.primaryColor,
              ),
              // This Style For Normal Text With SecondryColor
              titleMedium: TextStyle(
                fontSize: FontSize.s13,
                color: ColorManager.primaryColor,
              ),
              // This Style For Normal Text With ThirdColor
              titleSmall: TextStyle(
                fontSize: FontSize.s13,
                color: ColorManager.primaryColor,
              ),
              // This Style For Hint Text
              bodySmall: TextStyle(
                fontSize: FontSize.s8,
                color: ColorManager.hintTextColor,
              ),
            ),
      ),
    );
  }
}
