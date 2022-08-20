import 'package:field_validator/library.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "Field Validator test",
    (WidgetTester tester) async {
      // Check if the field has text, is at least 4 and at most 12 characters
      // long, and matches our only lowercase letterse, hypens and numbers
      // regex
      FieldValidator testValidator = const FieldValidator(
        [
          RequiredFieldValidator(
            errorMessage: "Field required",
          ),
          LengthFieldValidator(
            errorMessage: "Field needs at least 4 characters",
            minLength: 4,
          ),
          LengthFieldValidator(
            errorMessage: "Field can have up to 12 characters",
            maxLength: 12,
          ),
          PatternFieldValidator(
            r"(^[a-z])([a-z0-9-]*)([a-z0-9]$)",
            errorMessage: "Use only lowercase letters hyphens and numbers",
          ),
        ],
      );

      // The value test-1 respects all the rules it should validate so we
      // expect it to return null
      expect(testValidator.validate("test-1"), equals(null));

      // Now we are using a capital letter, so it should break the pattern rule
      // therefore it should return us the error message
      expect(
        testValidator.validate("Test-1"),
        equals("Use only lowercase letters hyphens and numbers"),
      );
    },
  );
}
