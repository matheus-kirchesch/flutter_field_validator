import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates a date field.
class DateFieldValidator extends FieldValidatorCore {
  const DateFieldValidator({
    required super.errorMessage,
    this.minDate,
    this.maxDate,
  });

  /// Min acceptable date.
  final DateTime? minDate;

  /// Max acceptable date.
  final DateTime? maxDate;

  @override
  bool isValid(String? field) {
    if (field == null || field.isEmpty) return true;

    DateTime? fieldDate = DateTime.tryParse(field);

    if (fieldDate == null) return false;

    if (minDate != null && fieldDate.isBefore(minDate!)) {
      return false;
    }

    if (maxDate != null && fieldDate.isAfter(maxDate!)) {
      return false;
    }

    return true;
  }
}
