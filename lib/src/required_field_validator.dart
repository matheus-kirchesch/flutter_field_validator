import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates if the field if not empty.
class RequiredFieldValidator extends FieldValidatorCore {
  const RequiredFieldValidator({required super.errorMessage})
      : super(validateEmptyField: true);

  @override
  bool isValid(String? field) {
    return field != null && field.isNotEmpty;
  }
}
