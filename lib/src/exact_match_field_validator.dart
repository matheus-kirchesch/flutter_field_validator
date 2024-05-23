import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates if the field matches the text.
class ExactMatchFieldValidator extends FieldValidatorCore {
  const ExactMatchFieldValidator(
    this.text, {
    required super.errorMessage,
    this.caseSensitive = true,
  });

  /// Will validate based on this text.
  final String text;

  /// The pattern we use to validate.
  final bool caseSensitive;

  @override
  bool isValid(String? field) {
    if (!caseSensitive) {
      return text.toLowerCase() == field?.toLowerCase();
    }

    return text == field;
  }
}
