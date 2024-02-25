import 'dart:developer';

import 'package:flutter_application_2/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<UserRegisterEvent>(_register);
    on<RegisterCheckBoxEvent>(_updateDataProductionUpload);
    on<RegistercontactTypeEvent>(_updatecontactType);
    on<AddStoreEvent>(_updateStore);
    on<RegisterCleanEvent>(_resetRegister);
  }
  final registerData = <String, dynamic>{};

  _updateDataProductionUpload(
      RegisterCheckBoxEvent event, Emitter<RegisterState> emit) {
    registerData['isEnableProductUpload'] = event.isSelected;
    emit(RegisterUpdateState(data: registerData));
  }

  _updatecontactType(
      RegistercontactTypeEvent event, Emitter<RegisterState> emit) {
    registerData['contactType'] = event.contactType;
    emit(RegisterUpdateState(data: registerData));
  }

  _updateStore(AddStoreEvent event, Emitter<RegisterState> emit) {
    final stores =
        (registerData['stores'] == null ? [] : registerData['stores'] as List);

    for (var store in stores) {
      if (store['Text'] == event.storeName) {
        emit(RegisterFailedState(message: 'Stores Must me Unique'));
        return;
      }
    }

    final storeData = {'Text': event.storeName!};
    stores.add(storeData);
    registerData['stores'] = stores;
    emit(RegisterUpdateState(data: registerData));
  }

  _resetRegister(RegisterCleanEvent event, Emitter<RegisterState> emit) {
    registerData.clear();
    emit(RegisterUpdateState(data: registerData));
  }

  _register(UserRegisterEvent event, Emitter<RegisterState> emit) async {
    if (registerData['contactType'] == null) {
      emit(RegisterFailedState(message: 'Please select a Catagory'));
      return;
    }
    registerData['isEnableProductUpload'] ??= false;
    registerData["companyId"] = "DEF56C4F-808D-4F81-993C-EF67C77A5F91";
    registerData['isDefaultBranchLocation'] = true;
    registerData['loginName'] = event.loginName;
    registerData['name'] = event.name;
    registerData['password'] = event.password;
    registerData['emailId'] = event.email;
    registerData['mobile'] = event.mobile;
    registerData['stores'] ??= [];

    var staticData = {
      "accountTypeId": 2,
      "company": "JBS991",
      "professionalSkills": "tech991",
      "subscriptionId": 1,
      "isPrimaryAddress": false,
      "address": "Jublihills1",
      "zipCode": "50003",
      "country": "india",
      "contactCompany": "JBS991",
      "mid": "MIN#00"
    };

    registerData.addAll(staticData);
    final either = await AuthRepo().register(registerData);
    either.fold((error) {
      emit(RegisterFailedState(message: error.message));
    }, (response) {
      log('request successful');
      emit(RegisterSuccessState());
    });
  }
}
