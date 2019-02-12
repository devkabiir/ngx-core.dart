part of '../../ngx_core.dart';

/// An interface that should be implemented by a class providing identity information.
abstract class Identity {
  
  /// An identifier that can uniquely identify a user identity.
  String get id;
}
