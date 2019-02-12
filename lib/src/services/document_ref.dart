part of '../../ngx_core.dart';

/// Provides access to the HTML document.
class DocumentRef {

  /// Appends a JavaScript file with a given [id] to the document.
  Future<dom.Event> appendScript(String id, String src) {
    final script = dom.ScriptElement()
      ..async = true
      ..id = id;

    final future = _appendElement(script);
    script.src = src;
    return future;
  }

  /// Appends a CSS stylesheet with a given [id] to the document.
  Future<dom.Event> appendStylesheet(String id, String href) {
    final stylesheet = dom.LinkElement()
      ..id = id
      ..rel = 'stylesheet';

    final future = _appendElement(stylesheet);
    stylesheet.href = href;
    return future;
  }

  /// Appends an [element] to the document.
  Future<dom.Event> _appendElement(dom.Element element) {
    final completer = Completer<dom.Event>();
    element
      ..onError.listen(completer.completeError)
      ..onLoad.listen(completer.complete);

    final node = dom.document.getElementById(element.id);
    if (node == null) dom.document.head.append(element);
    else {
      node.parent.insertBefore(element, node);
      node.remove();
    }

    return completer.future;
  }
}
