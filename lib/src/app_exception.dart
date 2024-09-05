abstract class AppException implements Exception {
  abstract final String code;
  final Object? parent;
  final StackTrace? stackTrace;
  final Map<String, Object?> _context = {};
  String? _message;

  String get message => _message ?? '';

  set message(String value) => _message = value;

  Map<String, Object?> get context => _context;

  set context(Map<String, Object?> values) => _context.addAll(values);

  AppException({String? message, StackTrace? stack, this.parent})
      : _message = message,
        stackTrace = stack;

  @override
  String toString() {
    final rows = <String>[];
    Object? current = this;
    for (int i = 0; i <= 5; i++) {
      if (current is AppException) {
        rows.add(AppException._formatedExceptionMessage(current));
        current = current.parent;
      } else {
        break;
      }
    }
    return rows.join('\n');
  }

  static String formatedExceptionMessage(AppException exception) {
    final data = <String>[];
    data.add(
        '[ERROR 💀️] code: (${exception.code}), message: ${exception.message}${exception.parent != null ? ', has parent ${exception.parent is AppException ? (exception.parent as AppException).code : ''}' : ''}');
    if (exception.stackTrace != null) {
      data.add('[STACK 🔦💀] ${exception.stackTrace}');
    }
    for (final item in exception._context.entries) {
      data.add('[CONTEXT 🤮💀️] ${item.key.toString()} => ${item.value.toString()}');
    }
    return data.join('\n');
  }
}
