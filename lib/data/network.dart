import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:flutter_application_2/util/typdef.dart';
import 'package:http/http.dart' as http;

import '../util/app_exceptions.dart';

class Api {
  static final header = {'content-type': 'application/json'};

  static EitherResponse post(Map<String, dynamic> rawData, String url,
      [String? token]) async {
    final body = jsonEncode(rawData);
    final uri = Uri.parse(url);
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await http.post(uri, body: body, headers: header);
      log(response.statusCode.toString());
      log(response.body);
      final result = decodeResponse(response);
      return Right(result);
    } on SocketException {
      return Left(NetworkException());
    } catch (e) {
      log(e.toString());
      if (e is InternelServerException) {
        return Left(
          InternelServerException(message: 'All Creadentials must be unique'),
        );
      }
      return Left(CustomException(message: 'Somthing went wrong'));
    }
  }

  static decodeResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 500) {
      throw InternelServerException();
    } else {
      throw CustomException(message: 'something went wrong');
    }
  }
}
