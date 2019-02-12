part of '../../ngx_core.dart';

/// Defines the methods and properties of the client application.
class Application {
  /// Creates a new configuration service.
  Application(@APP_ID String appId, @Optional() @envToken String environment,
      this._configuration, this._meta)
      : environment = environment ??
            const String.fromEnvironment('env', defaultValue: 'development'),
        id = _configuration['id'] ?? appId;

  /// The application settings.
  final Configuration _configuration;

  /// The service providing access to the meta tags.
  final Meta _meta;

  /// The base URL of the remote services.
  Uri get apiUrl => _configuration['apiUrl'] is String
      ? Uri.tryParse(_configuration['apiUrl'])
      : null;

  /// Value indicating whether the application is running in debug mode.
  bool get debug =>
      _configuration['debug'] ??
      const ['development', 'test'].contains(environment);

  /// The application environment. Defaults to `"development"`.
  final String environment;

  /// A string that uniquely identifies this application.
  final String id;

  /// The language that the document is written in.
  String get language => dom.document.documentElement.lang;
  set language(String value) => dom.document.documentElement.lang = value;

  /// The application name. Defaults to `"My Application"`.
  String get name => _meta['application-name'] ?? 'My Application';
  set name(String value) => _meta['application-name'] = value;

  /// Value indicating whether smooth scrolling is supported.
  bool get smoothScrollSupported {
    try {
      return dom.document.documentElement.style.scrollBehavior != null;
    } on Exception {
      return false;
    }
  }

  /// The version number of the application package. Defaults to `"1.0"`.
  String get version =>
      _configuration['version'] ??
      const String.fromEnvironment('version', defaultValue: '1.0');

  /// Forces the currently requested URL to use a secure channel (e.g. HTTPS).
  void useSecureConnection() {
    if (Uri.base.scheme != 'https')
      dom.window.location.assign(Uri.base.replace(scheme: 'https').toString());
  }
}
