import 'package:either_dart/either.dart';
import 'package:flutter_application_2/util/app_exceptions.dart';

typedef EitherResponse<T> = Future<Either<AppException, T>>;
