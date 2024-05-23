import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates the field based on a specified condition.
class ConditionFieldValidator extends FieldValidatorCore {
  const ConditionFieldValidator(
    this.condition, {
    required super.errorMessage,
    super.validateEmptyField,
  });

  /// Validate condition.
  final bool Function(String? field) condition;

  @override
  bool isValid(String? field) => condition.call(field);
}
