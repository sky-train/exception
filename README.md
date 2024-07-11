# Exception

    abstract AppException

```dart 

  void print() {
    var data = <String>[];
    data.add('[ERROR 💀️] message: $message ${parent != null ? ' parent: ${parent?.runtimeType.toString()}' : ''}');
    if (stackTrace != null) {
      data.add('[STACK 🔦💀] $stackTrace');
    }
    for (final item in _context.entries) {
      data.add('[CONTEXT 🤮💀️] ${item.key.toString()}, ${item.value.toString()}');
    }
    console.error(data.join('\n'));
  }

```

