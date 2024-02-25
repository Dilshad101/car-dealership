part of 'profile_bloc.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileSuccessState extends ProfileState {
  final List result;

  ProfileSuccessState({required this.result});
}

final class SignleProfileSuccessState extends ProfileState {
  final Map<String,dynamic> result;

  SignleProfileSuccessState({required this.result});
}


final class ProfileFailedState extends ProfileState {
  final String error;

  ProfileFailedState({required this.error});
}
