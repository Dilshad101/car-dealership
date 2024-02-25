part of 'register_bloc.dart';

sealed class RegisterEvent {}

class UserRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String mobile;
  final String city;
  final String state;
  final String storeName;
  final String loginName;

  UserRegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.mobile,
    required this.city,
    required this.state,
    required this.storeName,
    required this.loginName,
  });
}

class RegisterCheckBoxEvent extends RegisterEvent {
  final bool isSelected;

  RegisterCheckBoxEvent({required this.isSelected});
}

class RegistercontactTypeEvent extends RegisterEvent {
  final String? contactType;

  RegistercontactTypeEvent({required this.contactType});
}

class AddStoreEvent extends RegisterEvent {
  final String? storeName;

  AddStoreEvent({required this.storeName});
}

class RegisterCleanEvent extends RegisterEvent {}
