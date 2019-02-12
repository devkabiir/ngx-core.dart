/// Core library for [AngularDart](https://webdev.dartlang.org/angular) applications.
library ngx_core;

import 'dart:async';
import 'dart:collection';
import 'dart:html' as dom;
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:biscuits/biscuits.dart' hide SimpleChange;

part 'src/tokens.dart';
part 'src/directives/document_title.dart';
part 'src/directives/go_back.dart';
part 'src/models/identity.dart';
part 'src/pipes/encode_uri_pipe.dart';
part 'src/pipes/nl2br_pipe.dart';
part 'src/services/application.dart';
part 'src/services/configuration.dart';
part 'src/services/document_ref.dart';
part 'src/services/meta.dart';
part 'src/services/session.dart';
part 'src/services/title.dart';

/// A convenience list of all directives exposed by this library.
const List ngxDirectives = [DocumentTitle, GoBack];

/// A convenience list of all pipes exposed by this library.
const List ngxPipes = [EncodeUriPipe, Nl2brPipe];

/// A convenience list of all providers exposed by this library.
const Module ngxProviders = Module(provide: [
  ClassProvider(Application),
  ClassProvider(Configuration),
  ClassProvider(DocumentRef),
  ClassProvider(Meta),
  ClassProvider(Session),
  ClassProvider(Title)
]);
