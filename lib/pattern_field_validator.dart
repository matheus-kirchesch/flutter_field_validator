import 'package:field_validator/field_validator_core.dart';

/// Validates if the field matches the pattern.
class PatternFieldValidator extends FieldValidatorCore {
  const PatternFieldValidator(
    this._pattern, {
    required super.errorMessage,
    bool caseSensitive = true,
    bool inverse = false,
  })  : _caseSensitive = caseSensitive,
        _inverse = inverse;

  /// The pattern we use.
  final Pattern _pattern;

  /// If the match should be case sensitive.
  final bool _caseSensitive;

  /// If true we will validate true for no matches.
  final bool _inverse;

  @override
  bool isValid(String? field) {
    if (field == null || field.isEmpty) return true;

    bool hasMatch = RegExp(
      _pattern.toString(),
      caseSensitive: _caseSensitive,
    ).hasMatch(field);

    if (!_inverse) {
      return hasMatch;
    } else {
      return !hasMatch;
    }
  }
}
