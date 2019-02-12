part of '../../ngx_core.dart';

/// Navigates to the previous page in the session history when the underlying control is clicked.
@Directive(exportAs: 'goBack', selector: '[goBack]')
class GoBack {

  /// Creates a new `goBack` directive.
  GoBack(this._location, this._router);

  /// The service providing access to the browser's URL.
  final Location _location;

  /// The routing service.
  final Router _router;

  /// Value indicating whether a previous page in navigation history is available.
  bool get canGoBack => dom.window.history.length > 2;

  /// The path to be used when the session history is empty.
  @Input('goBack')
  String fallbackPath = '/';

  /// Navigates to the previous page in the session history if any, otherwise navigates to the [fallbackPath].
  @HostListener('click')
  void onClick() {
    if (canGoBack) _location.back();
    else if (fallbackPath.isNotEmpty) _router.navigate(fallbackPath);
    else _router.navigate('/');
  }
}
