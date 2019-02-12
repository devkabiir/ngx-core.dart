part of '../../ngx_core.dart';

/// Provides access to the metadata of the current document.
class Meta {

  /// The character encoding of the current document.
  String get charset => _getMeta('charset')?.getAttribute('charset')?.toUpperCase();

  /// The short and accurate summary of the document's content.
  String get description => this['description'];
  set description(String value) => this['description'] = value;

  /// The words relevant to the document's content.
  List<String> get keywords => this['keywords'] != null ? this['keywords'].split(',').map((keyword) => keyword.trim()).toList() : <String>[];
  set keywords(List<String> values) => this['keywords'] = values.join(', ');

  /// The theme color.
  String get themeColor => this['theme-color'];
  set themeColor(String value) => this['theme-color'] = value;

  /// Gets the value of the metadata with the specified [name].
  String operator [](String name) => _getMeta('name="$name"')?.content;

  /// Sets the value of the metadata with the specified [name].
  void operator []=(String name, String value) {
    final meta = _getMeta('name="$name"');
    if (meta != null) meta.content = value;
    else dom.document.head.append(dom.MetaElement()
      ..content = value
      ..name = name);
  }

  /// Gets the value of the `http-equiv` tag with the specified [keyword].
  String getHttpEquiv(String keyword) => _getMeta('http-equiv="$keyword"')?.content;

  /// Gets the meta element corresponding to the specified attribute [selector].
  dom.MetaElement _getMeta(String selector) => dom.querySelector('meta[$selector]');
}
