import 'package:field_validator/field_validator_core.dart';

/// Validates if the field if not empty
class LengthFieldValidator extends FieldValidatorCore {
  const LengthFieldValidator({
    required String errorMessage,
    this.minLength,
    this.maxLength,
  }) : super(errorMessage: errorMessage);

  /// The min length if set
  final int? minLength;

  /// The max length if set
  final int? maxLength;

  @override
  bool isValid(String? field) {
    // Check the min length
    if (minLength != null && field != null && field.length < minLength!) {
      return false;
    }

    // Check the max length
    if (maxLength != null && field != null && field.length > maxLength!) {
      return false;
    }

    return true;
  }
}
