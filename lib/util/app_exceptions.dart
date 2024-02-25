class AppException implements Exception {
  final String message;

  AppException({required this.message});
}

class NetworkException extends AppException {
  NetworkException({super.message = 'Please check you network connection'});
}

class InternelServerException extends AppException {
  InternelServerException(
      {super.message = 'Server is not available Please try again'});
}

class CustomException extends AppException {
  CustomException({required super.message});
}
