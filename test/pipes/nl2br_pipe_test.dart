import 'package:ngx_core/ngx_core.dart';
import 'package:test/test.dart';

/// Tests the features of the [Nl2brPipe] class.
void main() => group('Nl2brPipe', () {
  group('.transform()', () {
    test('should convert line separators into HTML line breaks', () {
      final pipe = Nl2brPipe();
      expect(pipe.transform('foo\n \nbar', false), 'foo<br> <br>bar');
      expect(pipe.transform('foo\r\nbar', false), 'foo<br>bar');
    });

    test('should convert line separators into XHTML line breaks', () {
      final pipe = Nl2brPipe();
      expect(pipe.transform('foo\n \nbar', true), 'foo<br/> <br/>bar');
      expect(pipe.transform('foo\r\nbar', true), 'foo<br/>bar');
    });
  });
});
