import 'package:flutter/material.dart';

import 'app_sizes.dart';
import 'color_manager.dart';
import 'style_manager.dart';

abstract class TextStyleManager {
  // TEXT STYLE FOR BASE

  /// 1 - TEXT LABEL STYLE FOR TEXTFIELD 14
  static final TextStyle labelFieldStyle = mediumFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  /// 2 - TEXT HINT STYLE FOR TEXTFIELD 12
  static final TextStyle hintFieldStyle = regularFont(
    color: ColorManager.primary,
    fontSized: FontSize.s16,
  );

  /// 3 - LOADING BUTTON TITLE STYLE 14
  static final TextStyle loadingButtonStyle = boldFont(
    color: ColorManager.white,
    fontSized: FontSize.s14,
  );

  /// 4 - DEFAULT BUTTON TITLE STYLE 14
  static final TextStyle defaultButtonStyle = boldFont(
    color: ColorManager.white,
    fontSized: FontSize.s18,
  );

  /// 5 - DROPDOWN STYLE 12
  static final TextStyle dropDownStyle = boldFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  /// 6 - DROPDOWN ITEM STYLE 12
  static final TextStyle dropdownItemStyle = mediumFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  /// 7 - SEARCH BOX STYLE 12
  static final TextStyle searchBoxStyle = mediumFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  /// 8 - DROPDOWN POPUP STYLE 12
  static final TextStyle popUpDropDownStyle = mediumFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  /// 8 - DROPDOWN LABEL STYLE 12
  static final TextStyle dropDownLabelStyle = mediumFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  /// 8 - DROPDOWN HINT STYLE 12
  static final TextStyle dropDownHintStyle = regularFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  /// 9 - SNACKBAR STYLE 12
  static final TextStyle snackBarStyle = regularFont(
    color: ColorManager.greyBorder,
    fontSized: FontSize.s14,
  );

  static final TextStyle errorStyle = regularFont(
    color: ColorManager.secondry,
    fontSized: FontSize.s14,
  );
//----------------------------------------- DYNAMIC TEXT STYLE FOR APP ----------------------------------------------
  ///  1 - TEXT STYLE FOR PRIMARY COLOR 12
  static final TextStyle primaryStyle = regularFont(
    color: ColorManager.primary,
    fontSized: FontSize.s16,
  );

  ///  2 - TEXT STYLE FOR SECONDARY COLOR 16
  static final TextStyle secondryStyle = regularFont(
    color: ColorManager.secondry,
    fontSized: FontSize.s16,
  );

  ///  3 - TEXT STYLE FOR titlesStyle COLOR 14
  static final TextStyle titlesStyle = boldFont(
    color: ColorManager.primary,
    fontSized: FontSize.s18,
  );

  ///  4 - TEXT STYLE FOR thirdStyle COLOR 18
  static final TextStyle thirdStyle = regularFont(
    color: ColorManager.white,
    fontSized: FontSize.s16,
  );

  ///  5 - TEXT STYLE FOR SECONDARY COLOR 10
  static final TextStyle tinyStyle = regularFont(
    color: ColorManager.greyBorder,
    fontSized: FontSize.s12,
  );

  ///  6 - TEXT STYLE FOR appBarStyle COLOR 18
  static final TextStyle appBarStyle = boldFont(
    color: ColorManager.white,
    fontSized: FontSize.s20,
  );

  ///  7 - TEXT STYLE FOR tabBar COLOR 16
  static final TextStyle tabBarStyle = boldFont(
    color: ColorManager.primary,
    fontSized: FontSize.s12,
  );

  ///  8-
  static final TextStyle forthStyle = boldFont(
    color: ColorManager.secondry,
    fontSized: FontSize.s18,
  );
}
