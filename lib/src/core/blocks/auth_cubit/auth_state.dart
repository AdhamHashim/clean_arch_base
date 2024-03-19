// ignore_for_file: use_super_parameters

part of 'auth_cubit.dart';

abstract class AuthState {
  final bool authorized;
  const AuthState(this.authorized);
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(false);
}

class AuthUpdated extends AuthState {
  const AuthUpdated(bool authorized) : super(authorized);
}
