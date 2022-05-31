import 'package:field_validator/field_validator_core.dart';

/// Takes in Field Validators and validates them
class FieldValidator {
  const FieldValidator(this.validators, {this.displayMultipleMessages = false});

  /// All our validators
  final List<FieldValidatorCore> validators;

  /// If true will display multiple messages otherwise just the latest
  final bool displayMultipleMessages;

  /// Validates our field validators
  String? validate() {
    String? message;

    for (FieldValidatorCore validator in validators) {
      // We failed to validate this one
      if (!validator.isValid()) {
        if (displayMultipleMessages && message != null && message.isNotEmpty) {
          if (!message.contains(validator.errorMessage)) {
            message += "\n";
            message += validator.errorMessage;
          }
        } else {
          message = validator.errorMessage;
        }
      }
    }

    return message;
  }
}
