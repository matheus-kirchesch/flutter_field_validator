import 'package:field_validator/field_validator_core.dart';

/// Validates if the field matches the pattern
class PatternFieldValidator extends FieldValidatorCore {
  const PatternFieldValidator(
    this._pattern, {
    required String errorMessage,
    bool caseSensitive = true,
  })  : _caseSensitive = caseSensitive,
        super(errorMessage: errorMessage);

  /// The pattern we use to validate emails
  final Pattern _pattern;

  /// The pattern we use to validate emails
  final bool _caseSensitive;

  @override
  bool isValid(String? field) {
    if (field == null) return false;

    return RegExp(
      _pattern.toString(),
      caseSensitive: _caseSensitive,
    ).hasMatch(field);
  }
}
