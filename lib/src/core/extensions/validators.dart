import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_base/src/config/res/app_strings.dart';

class Validators {
  static String? validateEmpty(String? value, {String? message}) {
    if (value == null || value.isEmpty) {
      return message ?? AppString.fillField.tr();
    }
    return null;
  }

  static String? validatePassword(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? AppString.passRequiredValidation.tr();
    } else if (value!.length < 6) {
      return message ?? AppString.passValidation.tr();
    }
    return null;
  }

  static String? validateEmail(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? AppString.mailValidation.tr();
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.["
            r"a-zA-Z]+")
        .hasMatch(value!)) {
      return message ?? AppString.mailValidation.tr();
    }
    return null;
  }

  static String? validatePhone(String? value, {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ?? 'Empty Value Required!';
    } else if (!RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]'
                r'{4,6}$)')
            .hasMatch(value!) ||
        value.length < 10) {
      return message ?? AppString.phoneValidation.tr();
    }
    return null;
  }

  static String? validatePasswordConfirm(String? value, String? pass,
      {String? message}) {
    if (value?.trim().isEmpty ?? true) {
      return message ??  AppString.fillField.tr();
    } else if (value != pass) {
      return message ?? AppString.confirmValidation.tr();
    }
    return null;
  }

  static String? validateDropDown(dynamic value, {String? message}) {
    if (value == null) {
      return message ??  AppString.fillField.tr();
    }
    return null;
  }
}
