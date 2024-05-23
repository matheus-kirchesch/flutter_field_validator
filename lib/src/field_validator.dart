import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates a field based on the given [FieldValidatorCore]s.
class FieldValidator {
  const FieldValidator(
    this.validators, {
    this.displayMultipleMessages = false,
  });

  /// Validators.
  final List<FieldValidatorCore> validators;

  /// If true will display multiple messages otherwise just the latest.
  ///
  /// Defaults to false.
  final bool displayMultipleMessages;

  /// Validate all [validators].
  String? validate(String? field) {
    String? message;

    for (FieldValidatorCore validator in validators) {
      if (validator.isValid(field)) continue;

      if (!displayMultipleMessages) {
        return validator.errorMessage;
      }

      if (message != null) {
        message += '\n';
      }

      message ??= validator.errorMessage;
    }

    return message;
  }
}
