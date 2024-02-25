part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class LoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterUpdateState extends RegisterState {
  final Map<String, dynamic> data;

  RegisterUpdateState({required this.data});
}

final class RegisterFailedState extends RegisterState {
  final String message;

  RegisterFailedState({required this.message});
}
