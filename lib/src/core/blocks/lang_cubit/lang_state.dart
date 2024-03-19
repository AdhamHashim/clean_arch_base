// ignore_for_file: use_super_parameters

part of 'lang_cubit.dart';

abstract class LangState {
  final Locale locale;
  const LangState(this.locale);
}

class LangInitial extends LangState {
  const LangInitial() : super(const Locale("ar"));
}

class LangUpdateState extends LangState {
  const LangUpdateState(Locale locale) : super(locale);
}
