part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String token;

  LoginSuccessState({required this.token});
}

final class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({required this.error});
}
