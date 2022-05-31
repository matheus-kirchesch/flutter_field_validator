import 'package:field_validator/field_validator_core.dart';

/// Validates if the field if not empty
class RequiredFieldValidator extends FieldValidatorCore {
  const RequiredFieldValidator({required String errorMessage})
      : super(errorMessage: errorMessage);

  @override
  bool isValid(String? field) {
    return field != null && field.isNotEmpty;
  }
}
