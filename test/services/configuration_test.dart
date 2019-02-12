import 'package:ngx_core/ngx_core.dart';
import 'package:test/test.dart';

/// Tests the features of the [Configuration] class.
void main() => group('Configuration', () {
  group('.keys', () {
    test('should return an empty array for an empty configuration', () {
      expect(Configuration(<String, dynamic>{}).keys, isEmpty);
    });

    test('should return the list of keys for a non-empty configuration', () {
      expect(Configuration(<String, dynamic>{'foo': 'bar', 'baz': 'qux'}).keys, orderedEquals(<String>['foo', 'baz']));
    });
  });

  group('.onChanges', () {
    final config = Configuration(<String, dynamic>{});

    test('should trigger an event when a value is added', () {
      final subscription = config.onChanges.listen((changes) {
        expect(changes.keys, orderedEquals(<String>['foo']));
        expect(changes['foo'].previousValue, isNull);
        expect(changes['foo'].currentValue, 'bar');
      });

      config['foo'] = 'bar';
      subscription.cancel();
    });

    test('should trigger an event when a value is updated', () {
      final subscription = config.onChanges.listen((changes) {
        expect(changes.keys, orderedEquals(<String>['foo']));
        expect(changes['foo'].previousValue, 'bar');
        expect(changes['foo'].currentValue, 'baz');
      });

      config['foo'] = 'baz';
      subscription.cancel();
    });

    test('should trigger an event when a value is removed', () {
      final subscription = config.onChanges.listen((changes) {
        expect(changes.keys, orderedEquals(<String>['foo']));
        expect(changes['foo'].previousValue, 'bar');
        expect(changes['foo'].currentValue, isNull);
      });

      config.remove('foo');
      subscription.cancel();
    });
  });

  group('operator [] / operator []=', () {
    final config = Configuration(<String, dynamic>{'foo': 'bar'});

    test('should properly get the configuration entries', () {
      expect(config['foo'], 'bar');
      expect(config['baz'], isNull);
    });

    test('should properly set the configuration entries', () {
      config['foo'] = 666;
      expect(config['foo'], 666);

      config['baz'] = 'qux';
      expect(config['baz'], 'qux');
    });
  });

  group('.clear()', () {
    test('should properly remove all the configuration entries', () {
      final config = Configuration(<String, dynamic>{'foo': 'bar', 'baz': 'qux'});
      expect(config, hasLength(2));
      config.clear();
      expect(config, isEmpty);
    });
  });

  group('.remove()', () {
    test('should properly remove the configuration entries', () {
      final config = Configuration(<String, dynamic>{'foo': 'bar', 'baz': 'qux'});
      expect(config, hasLength(2));

      config.remove('foo');
      expect(config['foo'], isNull);
      expect(config, hasLength(1));

      config.remove('baz');
      expect(config, isEmpty);
    });
  });
});
