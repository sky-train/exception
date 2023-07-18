import 'app_exception.dart';

abstract class HttpException extends AppException {
  int _status = 500;

  int get httpStatus => _status;

  void setStatus(int httpStatus) {
    _status = httpStatus;
  }
}
