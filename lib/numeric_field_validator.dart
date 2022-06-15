import 'package:field_validator/field_validator_core.dart';

/// Validates if the field is numeric and in the specified range
class NumericFieldValidator extends FieldValidatorCore {
  const NumericFieldValidator({
    required String errorMessage,
    this.min,
    this.max,
  }) : super(errorMessage: errorMessage);

  /// The min value if set
  final num? min;

  /// The max value if set
  final num? max;

  @override
  bool isValid(String? field) {
    if (field == null || field.isEmpty) return true;

    num? fieldNumber = num.tryParse(field);

    if (fieldNumber == null) return false;

    if (min != null && fieldNumber < min!) {
      return false;
    }

    if (max != null && fieldNumber > max!) {
      return false;
    }

    return true;
  }
}
