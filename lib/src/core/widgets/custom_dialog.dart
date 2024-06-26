import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/res/app_sizes.dart';
import 'package:flutter_base/src/config/res/color_manager.dart';
import 'package:flutter_base/src/config/res/constants_manager.dart';

void showCustomDialog(BuildContext context,
    {required Widget child,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    bool barrierDismissible = true,
    Color? color}) {
  showGeneralDialog(
    context: context,
    barrierLabel: ConstantManager.emptyText,
    barrierDismissible: barrierDismissible,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: AppPadding.pH20),
          padding: padding ?? EdgeInsets.all(AppPadding.pH20),
          decoration: BoxDecoration(
            color: color ?? ColorManager.whiteColor,
            borderRadius: borderRadius ?? BorderRadius.circular(AppSize.sH25),
          ),
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
