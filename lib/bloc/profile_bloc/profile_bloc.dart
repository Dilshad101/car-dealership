import 'dart:async';
import 'dart:developer';
import 'package:flutter_application_2/data/local.dart';
import 'package:flutter_application_2/repository/profile_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetAllProfileEvent>(_getAllProfile);
    on<GetProfileByIdEvent>(_getProfileById);
  }

  Future<FutureOr<void>> _getAllProfile(
      GetAllProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final body = {"CompanyId": "DEF56C4F-808D-4F81-993C-EF67C77A5F91"};
    final either = await ProfileRepo().getAllProfile(body, event.token);
    log(event.token);
    either.fold((error) {
      emit(ProfileFailedState(error: error.message));
    }, (response) {
      emit(ProfileSuccessState(result: response));
    });
  }

  _getProfileById(GetProfileByIdEvent event, Emitter<ProfileState> emit) async {
    final data = {
      "CompanyId": "DEF56C4F-808D-4F81-993C-EF67C77A5F91",
      "companyBasicId": event.companyBasicId
    };
    final token = UserToken.instance.token;
    final either = await ProfileRepo().getSingleProfile(data, token);

    either.fold((error) {
      emit(ProfileFailedState(error: error.message));
    }, (response) {
      emit(SignleProfileSuccessState(result: response));
      emit(ProfileSuccessState(result: event.profiles));
    });
  }
}

// {
//     "Email": "admin@vvrseafoods.com",
//     "password": "VVR*54321"
// }