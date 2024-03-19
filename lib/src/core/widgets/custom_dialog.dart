import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/res/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomDialog(BuildContext context,
    {required Widget child,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    bool barrierDismissible = true,
    Color? color}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          padding:
              padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
              color: color ?? ColorManager.white,
              borderRadius: borderRadius ?? BorderRadius.circular(40)),
          child: child,
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return ScaleTransition(
        scale: anim,
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
