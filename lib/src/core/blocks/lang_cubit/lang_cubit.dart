// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(const LangInitial());

  onUpdateLanguage(String lang) {
    emit(LangUpdateState(Locale(lang)));
  }
}
