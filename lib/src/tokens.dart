part of '../ngx_core.dart';

/// The injection token representing the application configuration.
const OpaqueToken<Map<String, dynamic>> configToken = OpaqueToken<Map<String, dynamic>>('app.configuration');

/// The injection token representing the application environment.
const OpaqueToken<String> envToken = OpaqueToken<String>('app.environment');
