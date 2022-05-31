import 'package:field_validator/field_validator_core.dart';

/// Validates the field based on a specified condition
class ConditionFieldValidator extends FieldValidatorCore {
  const ConditionFieldValidator(this.condition, {required String errorMessage})
      : super(errorMessage: errorMessage);

  /// Will validate based on this condition
  final bool Function(String? field) condition;

  @override
  bool isValid(String? field) {
    return condition.call(field);
  }
}
