import 'package:app_exception/app_exceptions.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = AppException();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.code, 'AppException');
    });
  });
}
