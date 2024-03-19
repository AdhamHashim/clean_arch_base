import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/res/app_sizes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../res/color_manager.dart';

class CustomLoading {
  static showLoadingView() {
    return Center(
      child: SpinKitDoubleBounce(
        color: ColorManager.primary,
        size: AppSize.sH40,
      ),
    );
  }

  static showLoadingDialog() {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
      indicator: SizedBox(
        height: AppSize.sH60,
        width: AppSize.sW60,
        child: SpinKitFadingCircle(color: ColorManager.primary),
      ),
      dismissOnTap: false,
      status: "Loadi.ng..",
    );
  }

  static dismissLoading({Color? color}) {
    return EasyLoading.dismiss();
  }
}
