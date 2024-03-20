import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/res/app_sizes.dart';
import 'package:flutter_base/src/config/res/constans_manager.dart';
import 'package:flutter_base/src/core/widgets/offline_widget.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/themes/app_theme.dart';
import 'core/navigation/navigator.dart';
import 'core/navigation/route_generator.dart';
import 'core/shared/route_observer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(ScreenSizes.width, ScreenSizes.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) {
        return MaterialApp(
          title: ConstantManager.PROJECT_NAME,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.light,
          onGenerateRoute: RouterGenerator.getRoute,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [AppNavigationObserver()],
          navigatorKey: Go.navigatorKey,
          builder: (context, child) {
            return OfflineWidget(
              child: FlutterEasyLoading(child: child!),
            );
          },
        );
      },
    );
  }
}
