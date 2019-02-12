part of '../../ngx_core.dart';

/// Encodes strings using the percent-encoding.
@Pipe('encodeUri')
class EncodeUriPipe implements PipeTransform {
  /// Encodes the specified [value] using percent-encoding to make it safe for literal use as a URI component.
  String transform(String value) => Uri.encodeComponent(value);
}
