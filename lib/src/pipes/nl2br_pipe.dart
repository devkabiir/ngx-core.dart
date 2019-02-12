part of '../../ngx_core.dart';

/// Replaces all line separators by HTML line breaks.
@Pipe('nl2br')
class Nl2brPipe implements PipeTransform {

  /// Replaces all new lines in the specified [value] by HTML line breaks.
  /// An [isXhtml] value indicates whether to use XML compatible line breaks.
  String transform(String value, [bool isXhtml = false]) => // ignore: avoid_positional_boolean_parameters
    value.replaceAll(RegExp(r'\r?\n'), isXhtml ? '<br/>' : '<br>');
}
