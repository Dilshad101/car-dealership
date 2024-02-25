part of 'profile_bloc.dart';

sealed class ProfileEvent {}

class GetAllProfileEvent extends ProfileEvent {
  final String token;

  GetAllProfileEvent({required this.token});
}

class GetProfileByIdEvent extends ProfileEvent {
  final int companyBasicId;
  final List profiles;
  GetProfileByIdEvent({required this.companyBasicId,required this.profiles});
}
