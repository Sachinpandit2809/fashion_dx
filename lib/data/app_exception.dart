class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? message)
      : super(message, "error during communication");
}

class BadRequestException extends AppException {
  BadRequestException(String? message) : super(message, "invalid request");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? message)
      : super(message, 'unauthorised request ');
}
class InvalidInputException extends AppException {
  InvalidInputException(String? message) : super(message, "Invalid input");
}
