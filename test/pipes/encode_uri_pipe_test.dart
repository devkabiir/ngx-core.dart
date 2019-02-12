import 'package:ngx_core/ngx_core.dart';
import 'package:test/test.dart';

/// Tests the features of the [EncodeUriPipe] class.
void main() => group('EncodeUriPipe', () {
  group('.transform()', () {
    test('should encode non-ASCII characters into percent-encoded strings', () {
      final pipe = EncodeUriPipe();
      expect(pipe.transform('foo bar'), 'foo%20bar');
      expect(pipe.transform('foo\r\nbar'), 'foo%0D%0Abar');
    });
  });
});
