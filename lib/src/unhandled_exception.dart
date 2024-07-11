import 'app_exception.dart';

class UnhandledException extends AppException {
  @override
  final String code = 'UnhandledException';
  UnhandledException({super.message, super.parent, super.stack});

  static AppException wrapUnknown(Object? err, [StackTrace? stack]) {
    if (err is AppException) {
      return err;
    } else {
      return UnhandledException(parent: err, stack: stack);
    }
  }
}
