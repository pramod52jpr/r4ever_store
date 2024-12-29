class AppException implements Exception{
  final dynamic _message;
  final dynamic _prefix;
  const AppException([this._message, this._prefix]);

  @override
  String toString(){
    return "$_prefix $_message";
  }
}

class FetchDataException extends AppException{
  const FetchDataException([String? message]) : super (message ?? '', "Fetch Data Exception");
}

class NoInternetException extends AppException{
  const NoInternetException([String? message]) : super (message ?? '', "No internet connection");
}

class UnauthorisedException extends AppException{
  const UnauthorisedException([String? message]) : super (message ?? '', "Unauthorised connection");
}

class RequestTimeoutException extends AppException{
  const RequestTimeoutException([String? message]) : super (message ?? '', "Request time out");
}