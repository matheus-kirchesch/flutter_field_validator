import 'package:field_validator/field_validator_core.dart';

/// Validates if the field matches the text
class ExactMatchFieldValidator extends FieldValidatorCore {
  const ExactMatchFieldValidator(
    this._text, {
    required String errorMessage,
    bool caseSensitive = true,
  })  : _caseSensitive = caseSensitive,
        super(errorMessage: errorMessage);

  /// Will validate based on this text
  final String _text;

  /// The pattern we use to validate
  final bool _caseSensitive;

  @override
  bool isValid(String? field) {
    if (field == null) return false;

    if (!_caseSensitive) return _text.toLowerCase() == field.toLowerCase();

    return _text == field;
  }
}
