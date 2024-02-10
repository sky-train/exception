import 'dart:core' as core;

abstract class AppException implements core.Exception {
  abstract final core.String code;
  final core.Object? parent;
  final core.StackTrace? stackTrace;
  final core.Map<core.String, core.Object?> _context = {};


  core.String? _message;

  core.String get message {
    core.String topMessage = _message ?? parent?.toString() ?? '';
    return '${runtimeType.toString()}${'.$code '}$topMessage';
  }

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

  @core.override
  core.String toString() {
    return message;
  }

  void print() {
    var data = <core.String>[];
    data.add(
        '[ERROR 💀️] message: $message ${parent!=null?' parent: ${parent?.runtimeType.toString()}':''}');
    if (stackTrace != null) {
      data.add('[STACK 🔦💀] $stackTrace');
    }
    for (final item in _context.entries) {
      data.add('[CONTEXT 🤮💀️] ${item.key.toString()}, ${item.value.toString()}');
    }
    core.print(data.join('\n'));
  }
}
