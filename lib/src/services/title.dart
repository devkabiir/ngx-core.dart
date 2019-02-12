part of '../../ngx_core.dart';

/// Manages the title of the current document.
class Title {
  /// Creates a new title service.
  Title(this._app) : _text = dom.document.title;

  /// The application properties.
  final Application _app;

  /// The text of the document title.
  String _text;

  /// The text of the document title.
  String get text => _text;
  set text(String value) => setText(value, appendAppName: true);

  /// Sets the text of the document title.
  void setText(String value, {bool appendAppName = false}) {
    _text = value ?? '';
    dom.document.title = appendAppName ? '$_text - ${_app.name}' : _text;
  }
}
