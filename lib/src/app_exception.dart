abstract class AppException implements Exception {
  String? _code;
  Object? _parent;
  String? _message;
  StackTrace? _stackTrace;
  final Map<String, Object?> _props = {};
  final Map<String, Object?> _context = {};

  String get code =>
      '${runtimeType.toString()}${_code != null ? '.$_code' : ''}';

  String? get message => _message;

  Object? get parent => _parent;

  Map<String, Object?> get props => _props;

  StackTrace? get stackTrace => _stackTrace;

  Map<String, Object?> get context => _context;

  AppException([this._message]);

  @override
  String toString() {
    String parentInfo = '';
    if(_parent!=null) {
      if(_parent is AppException) {
        parentInfo = (_parent as AppException).code;
      }
      else  {
        parentInfo = '$_parent';
      }
    }

    var err =
        '[EXCEPTION 💀️] ${'code: $code'}${message != null ? ' message: ${message!}' : ''}${parentInfo.isNotEmpty ? ' parent: $parentInfo' : ''}';

    if (_stackTrace != null) {
      err += '\n[STACK 🔦💀] $_stackTrace';
    }

    if (_context.isNotEmpty) {
      _context.forEach((key, value) {
        err += '\n[CONTEXT 🤮💀️] $key, $value';
      });
    }

    return err;
  }

  void setCode(String code) {
    if (_code == null) {
      _code = code;
    } else {
      // log warn
    }
  }

  void setParent(Object exception) {
    if (_parent == null) {
      _parent = exception;
    } else {
      // log warn
    }
  }

  void setMessage(String message) {
    _message = message;
  }

  void setProps(Map<String, Object?> props) {
    _props.addAll(props);
  }

  void setContext(Map<String, Object?> context) {
    _context.addAll(context);
  }

  void setStackTrace(StackTrace stackTrace) {
    if (_stackTrace == null) {
      _stackTrace = stackTrace;
    } else {
      // log warn
    }
  }
}

class UnhandledException extends AppException {
  UnhandledException(Object parent) {
    setParent(parent);
  }

  static AppException wrapIfNotAppException(Object err) {
    if (err is! AppException) {
      return UnhandledException(err);
    }
    return err;
  }
}
