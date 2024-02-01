import 'dart:core' as core;

abstract class AppException implements core.Exception {
  abstract final core.int code; // 2 Unknown error.
  final core.Object? parent;
  final core.StackTrace? stackTrace;
  final core.Map<core.String, core.Object?> _context = {};


  core.String? _message;

  core.String? get message => '${runtimeType.toString()}${'.$code'}${_message != null ? ' $_message' : ''}';

  core.Map<core.String, core.Object?> get context => _context;

  AppException({core.String? message, core.StackTrace? stack, this.parent })
      : _message = message,
        stackTrace = stack;

  void setMessage(core.String message) {
    _message = message;
  }

  void setContext(core.Map<core.String, core.Object?> context) {
    _context.addAll(context);
  }

  void print() {
    var data = <core.String>[];
    data.add(
        '[ERROR 💀️] message: $message ${(parent != null && parent is AppException) ? 'parent: ${(parent as AppException).message}' : ''}');
    if (stackTrace != null) {
      data.add('[STACK 🔦💀] $stackTrace');
    }
    for (final item in _context.entries) {
      data.add('[CONTEXT 🤮💀️] ${item.key.toString()}, ${item.value.toString()}');
    }
    core.print(data.join('\n'));
  }
}
