import 'app_exception.dart';

class HttpException extends AppException {
  int _status = 500;

  int get httpStatus=> _status;

  void setStatus(int httpStatus) {
    _status = httpStatus;
  }

}

class HttpValidationException extends HttpException {

}
