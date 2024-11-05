


class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return "$_prefix $_message";
  }
}


class FetchDataException extends AppException{
  /// for example, we requested a response, but we did not get in 10 sec or particular time interval, we'll display this message.
  FetchDataException([String? message]) : super(message, "Error During Communication");
}

class BadRequestException extends AppException{
  /// for example,
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException{
  /// for example,
  UnauthorisedException([String? message]) : super(message, "Unauthorised Request");
}

class InvalidInputException extends AppException{
  /// for example,
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}
