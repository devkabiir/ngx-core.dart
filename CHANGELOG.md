# Changelog

## Version [0.13.0](https://github.com/cedx/ngx-core.dart/compare/v0.12.0...v0.13.0)
- Updated the package dependencies.

## Version [0.12.0](https://github.com/cedx/ngx-core.dart/compare/v0.11.0...v0.12.0)
- Breaking change: removed the `Application.forceSsl` property.
- Breaking change: removed the `ConfigToken` and `EnvToken` classes.
- Breaking change: renamed the `ngxModule` property to `ngxProviders`.
- Restored the `ngxDirectives` and `ngxPipes` convenience lists.
- Updated the package dependencies.
- Updated the URL of the Git repository.

## Version [0.11.0](https://github.com/cedx/ngx-core.dart/compare/v0.10.0...v0.11.0)
- Breaking change: raised the [Dart SDK](https://www.dartlang.org/tools/sdk) constraint.
- Updated the package dependencies.

## Version [0.10.0](https://github.com/cedx/ngx-core.dart/compare/v0.9.0...v0.10.0)
- Breaking change: removed the `documentFactory()` and `windowFactory()` factories.
- Breaking change: removed the `ngxDirectives` and `ngxPipes` properties.
- Breaking change: restored the `configToken` and `envTokens` injection tokens as children of the `OpaqueToken` class.
- Added an example code.
- Updated the package dependencies.

## Version [0.9.0](https://github.com/cedx/ngx-core.dart/compare/v0.8.0...v0.9.0)
- Breaking change: replaced the `configToken` and `envTokens` injection tokens by the `ConfigToken` and `EnvToken` classes.
- Breaking change: removed the `ngxProviders` property.
- Raised the [Dart SDK](https://www.dartlang.org/tools/sdk) constraint.
- Added the `Identity` interface.
- Added the `Session` service.
- Updated the package dependencies.

## Version [0.8.0](https://github.com/cedx/ngx-core.dart/compare/v0.7.0...v0.8.0)
- Added the `Application.id` property.
- Raised the [Dart SDK](https://www.dartlang.org/tools/sdk) constraint.
- Using optional `const` and `new`.
- Updated the package dependencies.

## Version [0.7.0](https://github.com/cedx/ngx-core.dart/compare/v0.6.0...v0.7.0)
- Breaking change: starting to use and support [Angular](https://webdev.dartlang.org/angular) 5.
- Breaking change: removed the `ngx_core.js` library.
- Breaking change: renamed the `Configuration.serviceUrl` property to `apiUrl`.
- Breaking change: renamed the `pageTitle` directive to `documentTitle`.
- Breaking change: renamed the `GoBack.fallbackRoute` property to `fallbackPath`.
- Added factories and providers for the `HtmlDocument` and `Window` classes from `dart:html`.
- Added the `Application.smoothScrollSupported` property.
- Added the `DocumentTitle.appendAppName` property.
- Added the `Title` service.
- Updated the package dependencies.

## Version [0.6.0](https://github.com/cedx/ngx-core.dart/compare/v0.5.0...v0.6.0)
- Breaking change: starting to use and support the [Dart 2 SDK](https://www.dartlang.org/tools/sdk).
- Breaking change: removed the `DocumentRef.nativeDocument` property.
- Breaking change: the `global` property now maps to the native `self` object.
- Added a user guide based on [MkDocs](http://www.mkdocs.org).

## Version [0.5.0](https://github.com/cedx/ngx-core.dart/compare/v0.4.0...v0.5.0)
- Breaking change: moved the JS-based functions and properties to the `ngx_core.js` library.
- Breaking change: removed the `configuration` and `environment` properties.
- Breaking change: removed the `JSObject` class.
- Added the `deleteProperty()` and `getProperties()` functions.
- Added new unit tests.
- The `ngx_core.js` library exports the functions from the `dart:js_util` library.
- Updated the package dependencies.

## Version [0.4.0](https://github.com/cedx/ngx-core.dart/compare/v0.3.0...v0.4.0)
- Breaking change: merged the `ngx_core.js_interop` library into `ngx_core`.
- Breaking change: removed the `windowFactory` factory.
- Breaking change: renamed the `convertToDart()` function to `dartify()`.
- Breaking change: renamed the `config` property to `configuration`.
- Breaking change: replaced the usage of `dart:js` library by `package:js` for [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) interoperability.
- Added the `JSObject` class.
- Added the `global` property.
- Updated the package dependencies.

## Version [0.3.0](https://github.com/cedx/ngx-core.dart/compare/v0.2.0...v0.3.0)
- Breaking change: removed the `configFactory` and `envFactory` factories.
- Breaking change: removed the `configProvider`, `envProvider` and `windowProvider` providers.
- The injection of `envToken` in `Application` constructor is now optional.
- The injection of `configToken` in `Configuration` constructor is now optional.
- The `pageTitle` directive implements `AfterViewInit` instead of `OnInit`, allowing interpolation in element's text content.

## Version [0.2.0](https://github.com/cedx/ngx-core.dart/compare/v0.1.0...v0.2.0)
- Breaking change: renamed the module exports by replacing the `core` prefix with `ngx`.
- Added an `exportAs` metadata to the `pageTitle` directive.
- Added the `goBack` directive.
- Added new unit tests.

## Version 0.1.0
- Initial release.
