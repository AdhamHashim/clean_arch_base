import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/navigation/navigator.dart';

enum Languages {
  english(Locale('en'), 'English'),
  arabic(Locale('ar'), 'Arabic');

  final String title;
  final Locale locale;

  const Languages(this.locale, this.title);

  static List<Locale> get suppoerLocales =>
      Languages.values.map((e) => e.locale).toList();

  static List<String> get titles =>
      Languages.values.map((e) => e.title).toList();

  static setLocale(Languages lang) {
    Go.navigatorKey.currentContext!.setLocale(lang.locale);
  }

  static setLocaleWithcContext(BuildContext context, Languages lang) {
    context.setLocale(lang.locale);
  }

  static Languages? get currentLanguage {
    final currentLocale =
        EasyLocalization.of(Go.navigatorKey.currentContext!)!.locale;
    return Languages.values
        .firstWhere((element) => element.locale == currentLocale);
  }
}
