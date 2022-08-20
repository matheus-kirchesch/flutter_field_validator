/// Base class for any field validator.
abstract class FieldValidatorCore {
  const FieldValidatorCore({required this.errorMessage});

  /// This validator's error message.
  final String errorMessage;

  /// Return true to validate the field.
  bool isValid(String? field);
}
