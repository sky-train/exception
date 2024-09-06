abstract class AppException implements Exception {
  abstract final int code;
  final Object? parent;
  final String? message;
  final StackTrace? trace;
  final Map<String, Object?> context = {};

  AppException({this.message, this.trace, this.parent});

  @override
  String toString() {
    final text = <String>[];
    final hasParent = parent != null;
    final errParentCode = hasParent
        ? ((parent is AppException)
            ? ', p(${(parent as AppException).code}, ${runtimeType.toString()})'
            : ', h.p.')
        : '';
    final errMessage = '${message ?? ''}$errParentCode';

    text.add('[💀️] $code, ${runtimeType.toString()}, $errMessage');

    if (trace != null && _checkBit(detailing, 1)) {
      text.add('[🔦💀] $trace');
    }
    if (_checkBit(detailing, 2)) {
      for (final item in context.entries) {
        text.add('[🤮💀️] ${item.key} => ${item.value?.toString()}');
      }
    }

    return text.join('\n');
  }

  /// 2 - show stack
  ///
  /// 4 - show context
  ///
  /// 6 -show all
  ///
  static int detailing = 0;
}

bool _checkBit(int value, int bit) => (value & (1 << bit)) != 0;
