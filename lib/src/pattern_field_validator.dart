import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates if the field matches the pattern.
class PatternFieldValidator extends FieldValidatorCore {
  const PatternFieldValidator(
    this.pattern, {
    required super.errorMessage,
    this.caseSensitive = true,
    this.inverse = false,
  });

  /// The pattern we use.
  final Pattern pattern;

  /// If the match should be case sensitive.
  final bool caseSensitive;

  /// If true we will validate true for no matches.
  final bool inverse;

  @override
  bool isValid(String? field) {
    final bool hasMatch = RegExp(
      pattern.toString(),
      caseSensitive: caseSensitive,
    ).hasMatch(field ?? '');

    return inverse ? !hasMatch : hasMatch;
  }
}
