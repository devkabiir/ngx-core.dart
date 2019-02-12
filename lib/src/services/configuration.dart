part of '../../ngx_core.dart';

/// Provides access to the application configuration.
class Configuration extends Object with MapMixin<String, dynamic> {
  // ignore: prefer_mixin

  /// Creates a new configuration service.
  Configuration(@Optional() @configToken Map<String, dynamic> params)
      : _params =
            Map<String, dynamic>.from(params ?? const <String, dynamic>{});

  /// The handler of "changes" events.
  final StreamController<Map<String, SimpleChange>> _onChanges =
      StreamController<Map<String, SimpleChange>>.broadcast();

  /// The custom application parameters.
  final Map<String, dynamic> _params;

  /// The keys of this configuration.
  @override
  Iterable<String> get keys => _params.keys;

  /// The stream of "changes" events.
  Stream<Map<String, SimpleChange>> get onChanges => _onChanges.stream;

  /// Returns the value for the given [key] or `null` if [key] is not in this configuration.
  @override
  dynamic operator [](Object key) => _params[key];

  /// Associates the [key] with the given [value].
  @override
  void operator []=(String key, Object value) {
    final previousValue = this[key];
    _params[key] = value;
    _onChanges.add({key: SimpleChange(previousValue, value)});
  }

  /// Removes all pairs from this configuration.
  @override
  void clear() {
    final changes = Map<String, SimpleChange>.fromIterable(keys,
        value: (key) => SimpleChange(this[key], null));
    _params.clear();
    _onChanges.add(changes);
  }

  /// Removes the specified [key] and its associated value from this configuration.
  /// Returns the value associated with [key] before it was removed.
  @override
  dynamic remove(Object key) {
    final previousValue = _params.remove(key);
    _onChanges.add({key: SimpleChange(previousValue, null)});

    return previousValue;
  }
}
