part of '../../ngx_core.dart';

/// Manages the user sessions.
class Session {
  /// Creates a new session service.
  Session(@Optional() Cookies cookies, this._app)
      : _cookies = cookies ?? Cookies(),
        endPoint = _app.apiUrl;

  /// The application instance.
  final Application _app;

  /// The cookie service.
  final Cookies _cookies;

  /// The identity object associated with the currently logged-in user.
  Identity _identity;

  /// The access token associated to this session.
  String get accessToken => _cookies['${_app.id}:session.accessToken'] ?? '';
  set accessToken(String value) =>
      _cookies['${_app.id}:session.accessToken'] = value;

  /// The URL of the end point associated to this class.
  final Uri endPoint;

  /// The identity object associated with the currently logged-in user.
  Identity get identity => _identity;

  /// The configuration of the identity cookie.
  final CookieOptions identityCookie = CookieOptions();

  /// Value indicating whether the current user is a guest (not authenticated).
  bool get isGuest => identity == null;

  /// The URL of the login page.
  String loginUrl = '/login';

  /// The URL that the user should be redirected to after login.
  String get returnUrl =>
      dom.window.sessionStorage['${_app.id}:session.returnUrl'] ?? '/';
  set returnUrl(String value) =>
      dom.window.sessionStorage['${_app.id}:session.returnUrl'] = value;

  /// Logs out the current user and removes authentication-related cookie data.
  Future<void> logout() async => _destroy();

  /// Frees all session variables and destroys all data registered to a session.
  void _destroy() {
    _cookies
      ..remove('${_app.id}:session.accessToken')
      ..remove('${_app.id}:session.identity');
    _identity = null;
  }
}
