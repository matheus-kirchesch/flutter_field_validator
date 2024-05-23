/// Base class for any field validator.
abstract class FieldValidatorCore {
  const FieldValidatorCore({
    required this.errorMessage,
    this.validateEmptyField = false,
  });

  /// Error message in case of invalidation.
  final String errorMessage;

  /// If true the [isValid] method will be called even if the given field is empty.
  final bool validateEmptyField;

  /// Return true to validate the field.
  bool isValid(String? field);
}
