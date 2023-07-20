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
    final dInfo = debugInfo();
    String result = '';
    if (dInfo.containsKey("message")) {
      result = '[EXCEPTION 💀️] ${dInfo["message"]!}';
    }
    if (dInfo.containsKey("stack")) {
      result +=
          '${dInfo.isNotEmpty ? '\n' : ''}[STACK 🔦💀]\n${dInfo["stack"]!}';
    }
    if (dInfo.containsKey("context")) {
      result +=
          '${dInfo.isNotEmpty ? '\n' : ''}[CONTEXT 🤮💀️]\n${dInfo["context"]!}';
    }
    return result;
  }

  Map<String, String> debugInfo() {
    String pInfo = '';
    String sInfo = '';
    String cInfo = '';

    if (_parent != null) {
      pInfo = _parent is AppException
          ? ' parent: ${(_parent as AppException).code}'
          : ' (has parent exception)';
    }

    String mInfo =
        '${'code: $code'}${message != null ? ' message: ${message!}' : ''}${pInfo.isNotEmpty ? pInfo : ''}';

    if (_stackTrace != null) {
      sInfo = _stackTrace
          .toString()
          .split('\n')
          .where((line) {
            return line.trim().isNotEmpty && line.trim().substring(0, 1) == "#";
          })
          .toList()
          .join('\n');
    }

    if (_context.isNotEmpty) {
      cInfo = _context.entries
          .map((e) => '${e.key}, ${e.value}')
          .toList()
          .join('\n');
    }

    return {
      "message": mInfo,
      "context": cInfo,
      "stack": sInfo,
    };
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
