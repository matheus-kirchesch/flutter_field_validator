# A simple field validator

Can be expanded upon fairly easily, you can create your own custom validators by inheriting the FieldValidatorCore.

# How to use

It is fairly simple, you instantiate a FieldValidator, pass in the validators and call validate.

```
// Flutter TextFormField using the FieldValidator
return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) => FieldValidator(
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
          ConditionFieldValidator(
            (field) => field == "type this",
            errorMessage: "You have to type type this",
          ),
        ],
        field: text,
      ).validate(),
    );
```