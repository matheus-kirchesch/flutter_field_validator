import 'package:flutter_field_validator/src/field_validator_core.dart';

/// Validates if the field if not empty.
class LengthFieldValidator extends FieldValidatorCore {
  const LengthFieldValidator({
    required super.errorMessage,
    this.minLength,
    this.maxLength,
  }) : assert(
          minLength != null || maxLength != null,
          'Specify either a [minLength] or a [maxLength]',
        );

  /// The min length if set.
  final int? minLength;

  /// The max length if set.
  final int? maxLength;

  @override
  bool isValid(String? field) {
    if (field == null) return false;

    if (minLength != null && field.length < minLength!) return false;

    if (maxLength != null && field.length > maxLength!) return false;

    return true;
  }
}
