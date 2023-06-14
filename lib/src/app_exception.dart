
class AppException implements Exception {
  String? _code;
  String? _message;
  Exception? _parent;
  final Map<String, Object?> _props = {};
  final Map<String, Object?> _context = {};


  String get code=>_code ?? runtimeType.toString();
  String? get message=>_message;

  AppException([this._message]);

  @override
  String toString() {
    return "[$code] ${message ?? ''}";
  }

  void setParent(Exception exception) {
    if(_parent==null) {
      _parent = exception;
    }
    else {
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


}

class UnhandledException extends AppException {
  UnhandledException(Exception parent) {
    setParent(parent);
  }
}