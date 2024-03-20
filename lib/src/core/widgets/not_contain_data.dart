import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/res/app_assets.dart';
import 'package:lottie/lottie.dart';
import '../../config/res/app_sizes.dart';
import '../../config/res/app_strings.dart';

class NotContainData extends StatelessWidget {
  const NotContainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          LottieManager.noData,
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.height * .3,
        ),
        SizedBox(height: AppSize.sH10),
        Text(AppString.errorExeptionNotContain.tr()),
        SizedBox(height: AppSize.sH10),
        Text(AppString.errorExeptionNotContainDesc.tr()),
      ],
    );
  }
}
