import 'app_exception.dart';

class UnhandledException extends AppException {
  @override
  final int code = 1;
  UnhandledException({super.message, super.parent, super.trace});

  static AppException wrapUnknown(Object? err, [StackTrace? trace]) {
    if (err is AppException) {
      return err;
    } else {
      return UnhandledException(parent: err, trace: trace);
    }
  }
}
