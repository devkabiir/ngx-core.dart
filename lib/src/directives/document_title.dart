part of '../../ngx_core.dart';

/// Sets the title of the current document.
@Directive(exportAs: 'documentTitle', selector: '[documentTitle]')
class DocumentTitle implements AfterViewInit {
  /// Creates a new `documentTitle` directive.
  DocumentTitle(this._element, this._title);

  /// The title of the current HTML document.
  final Title _title;

  /// The underlying HTML element.
  final dom.Element _element;

  /// Value indicating whether to append the application name to the document title.
  @Input()
  bool appendAppName = true;

  /// The text of the document title.
  @Input('documentTitle')
  String text = '';

  /// Method called when the component's view has been fully initialized.
  @override
  void ngAfterViewInit() {
    final documentTitle = text.isNotEmpty
        ? text
        : _element.text.trim().replaceAll(RegExp(r'\s+'), ' ');
    _title.setText(documentTitle, appendAppName: appendAppName);
  }
}
