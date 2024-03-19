// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import '../localization/localization_methods.dart';
// import '../res/assets_manager.dart';
// import '../res/color_manager.dart';
// import '../res/font_manager.dart';
// import '../res/values_manager.dart';

// internetExeption(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Lottie.asset(
//         AssetsManager.no_internet,
//         width: MediaQuery.of(context).size.width * .7,
//         height: MediaQuery.of(context).size.height * .3,
//       ),
//       SizedBox(height: AppSize.sH10),
//       Text(
//         tr(context, "ErrorToasts_noconnection"),
//         style: TextStyle(
//           fontSize: FontSize.s14,
//           color: ColorManager.secondry,
//         ),
//       ),
//       SizedBox(height: AppSize.sH10),
//       Text(
//         tr(context, "ErrorToasts_nointernetDesc"),
//         style: TextStyle(fontSize: FontSize.s14, color: ColorManager.secondry),
//       ),
//       SizedBox(height: AppSize.sH10),
//     ],
//   );
// }
