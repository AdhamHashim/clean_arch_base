// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  onUpdateAuth(bool authorized) {
    emit(AuthUpdated(authorized));
  }
}
