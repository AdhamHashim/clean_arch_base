import 'package:flutter/material.dart';

import '../../res/color_manager.dart';
import '../../res/app_sizes.dart';

class DefaultButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? elevation;
  final bool? disabled;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Widget? customChild;

  const DefaultButton({
    super.key,
    this.title,
    this.onTap,
    this.color,
    this.disabled,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    this.elevation,
    this.customChild,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          EdgeInsets.symmetric(
            horizontal: AppMargin.mW10,
            vertical: AppMargin.mH5,
          ),
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? AppSize.sH60,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            splashFactory: InkRipple.splashFactory,
            surfaceTintColor: color ?? ColorManager.primary,
            foregroundColor: color ?? ColorManager.primary,
            backgroundColor: color ?? ColorManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(AppSize.sH10),
              side: borderColor != null
                  ? BorderSide(
                      color: borderColor ?? ColorManager.primary, width: 1)
                  : BorderSide.none,
            ),
            elevation: elevation ?? 0,
          ),
          child: customChild ??
              Text(title ?? 'Click!',
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? FontSize.s16,
                    fontFamily: fontFamily,
                    fontWeight: fontWeight ?? FontWeight.w500,
                  )),
        ),
      ),
    );
  }
}
