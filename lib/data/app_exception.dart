class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppException {
  InternetException([String? message])
      : super(message, 'No Internet Exception');
}

class TimeoutException extends AppException {
  TimeoutException([String? message]) : super(message, 'No Internet Exception');
}

class serverException extends AppException {
  serverException([String? message]) : super(message, 'No Internet Exception');
}

class InvalidURLException extends AppException {
  InvalidURLException([String? message])
      : super(message, 'Invalid URL Exception');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}
