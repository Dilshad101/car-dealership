import 'package:flutter_application_2/util/app_url.dart';
import 'package:flutter_application_2/data/network.dart';
import 'package:flutter_application_2/util/typdef.dart';

class AuthRepo {
  EitherResponse register(Map<String, dynamic> data) {
    return Api.post(data, AppUrl.register);
  }

  EitherResponse login(Map<String, dynamic> data) =>
      Api.post(data, AppUrl.login);
}
