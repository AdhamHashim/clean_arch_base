import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../navigation/navigator.dart';
import '../res/color_manager.dart';
import 'app_text.dart';

class MessageUtils {
  static void showSnackBar(String message,
      {Color? backgroundColor, BuildContext? context}) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: AppText(message, color: ColorManager.white),
      backgroundColor: backgroundColor ?? ColorManager.white,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context ?? Go.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }

  static void showSimpleToast(
      {required String msg, Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? ColorManager.primary,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0.sp);
  }
}
