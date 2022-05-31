import 'package:field_validator/field_validator_core.dart';

/// Validates the field based on a specified condition
class ConditionFieldValidator extends FieldValidatorCore {
  const ConditionFieldValidator(this.condition, {required String errorMessage})
      : super(errorMessage: errorMessage);

  /// Will validate based on this condition
  final bool Function() condition;

  @override
  bool isValid() {
    return condition.call();
  }
}
