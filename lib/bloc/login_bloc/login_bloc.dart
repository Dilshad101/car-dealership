import 'dart:async';
import 'dart:developer';

import 'package:flutter_application_2/data/local.dart';
import 'package:flutter_application_2/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>(_loginUser);
  }

  FutureOr<void> _loginUser(
      LoginUserEvent event, Emitter<LoginState> emit) async {
    final userData = {'Email': event.email, 'Password': event.password};
    emit(LoginLoadingState());
    final either = await AuthRepo().login(userData);

    either.fold((error) {
      emit(LoginFailureState(error: error.message));
    }, (response) {
      final token = response['authToken'];
      UserToken.instance.set(token);
      log(UserToken.instance.token);
      emit(LoginSuccessState(token: token));
    });
  }
}
