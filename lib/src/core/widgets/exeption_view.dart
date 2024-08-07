import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/config/res/assets.gen.dart';
import 'package:lottie/lottie.dart';

import '../../config/res/app_sizes.dart';
import '../../config/res/color_manager.dart';
import 'buttons/default_button.dart';

class ExceptionView extends StatelessWidget {
  const ExceptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppAssets.lottie.error,
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .3,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: AppMargin.mH20),
            child: Center(
              child: Text(LocaleKeys.exceptionError),
            ),
          ),
          DefaultButton(
            width: MediaQuery.of(context).size.width * .45,
            title: LocaleKeys.contactUs,
            textColor: ColorManager.buttonTextColor,
            fontSize: FontSize.s12,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
