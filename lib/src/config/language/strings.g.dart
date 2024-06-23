import 'package:easy_localization/easy_localization.dart';

abstract class LocaleKeys {
  static const String _email = 'email';
  static String get email => _email.tr();

  static const String _signIn = 'sign_in';
  static String get signIn => _signIn.tr();

  static const String _welcome = 'welcome';
  static String get welcome => _welcome.tr();

  static const String _pleaseEnterTheCodeSentTo = 'please_enter_the_code_sent_to';
  static String get pleaseEnterTheCodeSentTo => _pleaseEnterTheCodeSentTo.tr();

  static const String _register = 'register';
  static String get register => _register.tr();

  static const String _shortKey = 'short_key';
  static String get shortKey => _shortKey.tr();

  static const String _shortKey2 = 'short_key2';
  static String get shortKey2 => _shortKey2.tr();

  static const String _home = 'home';
  static String get home => _home.tr();

  static const String _product = 'product';
  static String get product => _product.tr();

  static const String _category = 'category';
  static String get category => _category.tr();

}
