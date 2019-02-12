import 'dart:html';
import 'package:ngx_core/ngx_core.dart';
import 'package:test/test.dart';

/// Tests the features of the [Meta] class.
void main() => group('Meta', () {
  group('.charset', () {
    final meta = Meta();

    test('should be a `null` reference if the document does not specify a charset', () {
      expect(querySelector('meta[charset]'), isNull);
      expect(meta.charset, isNull);
    });

    test('should return the value of the `charset` metadata if the document specifies a charset', () {
      document.head.append(Element.tag('meta')..attributes['charset'] = 'iso-8859-15');
      expect(querySelector('meta[charset]'), isNotNull);
      expect(meta.charset, 'ISO-8859-15');
    });
  });

  group('.description', () {
    final meta = Meta();

    test('should be a `null` reference if the document does not specify a description', () {
      expect(querySelector('meta[name="description"]'), isNull);
      expect(meta.description, isNull);
    });

    test('should return the value of the `description` metadata if the document specifies a description', () {
      document.head.append(MetaElement()
        ..name = 'description'
        ..content = 'foo bar baz'
      );

      expect(querySelector('meta[name="description"]'), isNotNull);
      expect(meta.description, 'foo bar baz');
    });
  });

  group('.keywords', () {
    final meta = Meta();

    test('should be an empty list if the document does not specify any keyword', () {
      expect(querySelector('meta[name="keywords"]'), isNull);
      expect(meta.keywords, isEmpty);
    });

    test('should return the parsed list fom the `keywords` metadata if the document specifies some keywords', () {
      document.head.append(MetaElement()
        ..name = 'keywords'
        ..content = 'foo, bar, baz'
      );

      expect(querySelector('meta[name="keywords"]'), isNotNull);
      expect(meta.keywords, orderedEquals(<String>['foo', 'bar', 'baz']));
    });
  });

  group('.themeColor', () {
    final meta = Meta();

    test('should be a `null` reference if the document does not specify a theme color', () {
      expect(querySelector('meta[name="theme-color"]'), isNull);
      expect(meta.themeColor, isNull);
    });

    test('should return the value of the `theme-color` metadata if the document specifies a theme color', () {
      document.head.append(MetaElement()
        ..name = 'theme-color'
        ..content = '#336699'
      );

      expect(querySelector('meta[name="theme-color"]'), isNotNull);
      expect(meta.themeColor, '#336699');
    });
  });

  group('operator []', () {
    final meta = Meta();

    test('should return a `null` reference if the meta does not exist', () {
      expect(querySelector('meta[name="operator-get"]'), isNull);
      expect(meta['operator-get'], isNull);
    });

    test('should return the value of the `content` attribute if the meta exists', () {
      document.head.append(MetaElement()
        ..name = 'operator-get'
        ..content = 'foo'
      );

      expect(querySelector('meta[name="operator-get"]'), isNotNull);
      expect(meta['operator-get'], 'foo');
    });
  });

  group('operator []=', () {
    final meta = Meta();

    test('should append a new meta if it does not already exist', () {
      expect(querySelector('meta[name="operator-set"]'), isNull);
      meta['operator-set'] = 'foo';

      final MetaElement element = querySelector('meta[name="operator-set"]');
      expect(element.content, 'foo');
    });

    test('should replace the existing meta if it already exists', () {
      expect(querySelector('meta[name="operator-set"]'), isNotNull);
      meta['operator-set'] = 'bar';

      final MetaElement element = querySelector('meta[name="operator-set"]');
      expect(element.content, 'bar');
    });
  });

  group('.getHttpEquiv()', () {
    final meta = Meta();

    test('should return a `null` reference if the meta does not exist', () {
      expect(querySelector('meta[http-equiv="content-type"]'), isNull);
      expect(meta.getHttpEquiv('content-type'), isNull);
    });

    test('should return the value of the `content` attribute if the meta exists', () {
      document.head.append(MetaElement()
        ..httpEquiv = 'content-type'
        ..content = 'text/html; charset=UTF-8'
      );

      expect(querySelector('meta[http-equiv="content-type"]'), isNotNull);
      expect(meta.getHttpEquiv('content-type'), 'text/html; charset=UTF-8');
    });
  });
});
