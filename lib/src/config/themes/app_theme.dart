import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/res/app_sizes.dart';
import 'package:flutter_base/src/core/extensions/material_color_extension.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/color_manager.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: AppColors.primaryColor.toMaterialColor(),
      primaryColor: AppColors.primaryColor,
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
          foregroundColor: AppColors.primaryColor,
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
        foregroundColor: AppColors.whiteColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: AppColors.borderColor,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          // This Style For AppBar Text
          headlineLarge: TextStyle(
            fontSize: FontSize.s18,
            color: AppColors.secondryColor,
            fontWeight: FontWeightManager.medium,
          ),
          // This Style For Normal Text With PrimaryColor
          titleLarge: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primaryColor,
          ),
          // This Style For Normal Text With SecondryColor
          titleMedium: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primaryColor,
          ),
          // This Style For Normal Text With ThirdColor
          titleSmall: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primaryColor,
          ),
          // This Style For Hint Text
          bodySmall: TextStyle(
            fontSize: FontSize.s8,
            color: AppColors.hintTextColor,
          ),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primarySwatch: AppColorsWithDarkMode.primaryColor.toMaterialColor(),
      primaryColor: AppColorsWithDarkMode.primaryColor,
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: AppColorsWithDarkMode.whiteColor,
      ),
      scaffoldBackgroundColor: AppColorsWithDarkMode.borderColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColorsWithDarkMode.whiteColor,
        selectedItemColor: AppColorsWithDarkMode.primaryColor,
        unselectedItemColor: AppColorsWithDarkMode.greyColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pW4),
          foregroundColor: AppColorsWithDarkMode.primaryColor,
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
        foregroundColor: AppColorsWithDarkMode.whiteColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColorsWithDarkMode.whiteColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        prefixIconColor: AppColorsWithDarkMode.borderColor,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          // This Style For AppBar Text
          headlineLarge: TextStyle(
            fontSize: FontSize.s18,
            color: AppColors.secondryColor,
            fontWeight: FontWeightManager.medium,
          ),
          // This Style For Normal Text With PrimaryColor
          titleLarge: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primaryColor,
          ),
          // This Style For Normal Text With SecondryColor
          titleMedium: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primaryColor,
          ),
          // This Style For Normal Text With ThirdColor
          titleSmall: TextStyle(
            fontSize: FontSize.s13,
            color: AppColors.primaryColor,
          ),
          // This Style For Hint Text
          bodySmall: TextStyle(
            fontSize: FontSize.s8,
            color: AppColors.hintTextColor,
          ),
        ),
      ),
    );
  }
}
