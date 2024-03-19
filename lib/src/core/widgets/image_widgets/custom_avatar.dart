import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/res/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';


class CustomAvatar extends StatelessWidget {
  final String icon;
  final Color? color;
  final Color? iconColor;
  final double? height;
  final double? width;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  const CustomAvatar({
    super.key,
    required this.icon,
    this.color,
    this.iconColor,
    this.height,
    this.width,
    this.radius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color ?? ColorManager.greyBackground,
          borderRadius: BorderRadius.circular(radius ?? 8.r)),
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: 8.0.w,
          vertical: 8.0.h,
        ),
        child: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: iconColor,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
