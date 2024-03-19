import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../navigation/navigator.dart';
import '../../res/color_manager.dart';


class ButtonClose extends StatelessWidget {
  final VoidCallback? onTap;

  const ButtonClose({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Go.back();
          },
      child: Container(
        height: 25.h,
        width: 25.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          // color: ColorManager.get.grey.withOpacity(.3),
        ),
        child: Center(
          child: Icon(
            Icons.close,
            color: ColorManager.black,
            size: 24.r,
          ),
        ),
      ),
    );
  }
}
