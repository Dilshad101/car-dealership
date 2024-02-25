import 'package:flutter_application_2/data/network.dart';
import 'package:flutter_application_2/util/app_url.dart';
import 'package:flutter_application_2/util/typdef.dart';

class ProfileRepo {
  EitherResponse getAllProfile(var body, String token) =>
      Api.post(body, AppUrl.getAllProfile, token);

  EitherResponse getSingleProfile(var body, String token) =>
      Api.post(body, AppUrl.getProfileById, token);
}
