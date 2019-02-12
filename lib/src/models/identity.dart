part of '../../ngx_core.dart';

/// An interface that should be implemented by a class providing identity information.
abstract class Identity {
  /// A key that can be used to check the validity of a given identity identifier.
  String get authKey;

  /// An identifier that can uniquely identify a user identity.
  String get id;

  /// Validates the given authentication key.
  bool validateAuthKey(String authKey);
}
