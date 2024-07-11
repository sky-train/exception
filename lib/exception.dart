library;

abstract class AppException implements Exception {
  abstract final String code;
  final Object? parent;
  final StackTrace? stackTrace;
  final Map<String, Object?> _context = {};

  String? _message;

  String get message {
    String topMessage = _message ?? parent?.toString() ?? '';
    return '${runtimeType.toString()} $topMessage';
  }

  Map<String, Object?> get context => _context;

  AppException({String? message, StackTrace? stack, this.parent})
      : _message = message,
        stackTrace = stack;

  void setMessage(String message) {
    _message = message;
  }

  void setContext(Map<String, Object?> context) {
    _context.addAll(context);
  }

  @override
  String toString() {
    return message;
  }

}
