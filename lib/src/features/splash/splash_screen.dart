import 'package:flutter_base/src/core/res/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../core/navigation/navigator.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Go.offAll(const Scaffold());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 1.sh,
      width: 1.sw,
      child: Center(
        child: SvgPicture.asset(
          SVGManager.splashLogo,
          height: 0.3.sh,
          width: 0.3.sw,
        ),
      ),
    );
  }
}
