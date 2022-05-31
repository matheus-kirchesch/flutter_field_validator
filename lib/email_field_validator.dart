import 'package:field_validator/field_validator_core.dart';

/// Validates if the field is a valid email adress
class EmailFieldValidator extends FieldValidatorCore {
  const EmailFieldValidator({required String errorMessage})
      : super(errorMessage: errorMessage);

  /// The pattern we use to validate emails
  final Pattern _emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  @override
  bool isValid(String? field) {
    if (field == null) return false;

    return RegExp(
      _emailPattern.toString(),
      caseSensitive: false,
    ).hasMatch(field);
  }
}
