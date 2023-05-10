import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Takes in Field Validators and validates them.
class FieldValidator {
  const FieldValidator(
    this._validators, {
    bool displayMultipleMessages = false,
  }) : _displayMultipleMessages = displayMultipleMessages;

  /// All our validators.
  final List<FieldValidatorCore> _validators;

  /// If true will display multiple messages otherwise just the latest.
  final bool _displayMultipleMessages;

  /// Validates our field validators.
  String? validate(String field) {
    String? message;

    Iterable<FieldValidatorCore> validatorList =
        _displayMultipleMessages ? _validators : _validators.reversed;

    for (FieldValidatorCore validator in validatorList) {
      if (!validator.isValid(field)) {
        if (_displayMultipleMessages && message != null && message.isNotEmpty) {
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
