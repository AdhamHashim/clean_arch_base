import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/src/core/extensions/sized_box_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../res/color_manager.dart';

class CustomPinTextField extends StatelessWidget {
  final ValueChanged<String>? onCompleted;
  final TextEditingController controller;
  const CustomPinTextField(
      {super.key, required this.controller, this.onCompleted});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 52.w,
        height: 74.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[400]!),
        ));
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorManager.primary),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red),
    );
    return Pinput(
      length: 4,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      autofocus: true,
      separatorBuilder: (index) => 15.szW,
      focusedPinTheme: focusedPinTheme,
      defaultPinTheme: defaultPinTheme,
      errorPinTheme: errorPinTheme,
      onCompleted: onCompleted,
      controller: controller,
    );
  }
}
