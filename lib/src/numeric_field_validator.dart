import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates if the field is numeric and in the specified range.
class NumericFieldValidator extends FieldValidatorCore {
  const NumericFieldValidator({
    required super.errorMessage,
    this.min,
    this.max,
  }) : assert(
          min != null || max != null,
          'Specify either a [min] or a [max]',
        );

  /// The min value if set.
  final num? min;

  /// The max value if set.
  final num? max;

  @override
  bool isValid(String? field) {
    final num? fieldNumber = num.tryParse(field ?? '');
    if (fieldNumber == null) return false;

    if (min != null && fieldNumber < min!) return false;

    if (max != null && fieldNumber > max!) return false;

    return true;
  }
}
