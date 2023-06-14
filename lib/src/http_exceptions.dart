
import 'package:app_exception/app_exceptions.dart';

class HttpException extends AppException {
  int _status = 500;

  int get httpStatus=> _status;

  void setStatus(int httpStatus) {
    _status = httpStatus;
  }

}