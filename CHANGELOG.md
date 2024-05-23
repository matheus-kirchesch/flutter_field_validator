
# [v2.0.0] - 23.05.2024

- Updated the [FieldValidator] class to now accept null strings on the [validate]
method, making it easier to use with [Flutter]'s [TextFormField].
- The validation order is now always from first to last validator.
- Now the [FieldValidatorCore] can be configured to not be validated with empty
fields.
- Updated all native field validators with the empty field change in mind.

# [v1.1.0] - 10.05.2023

- Setup package for publishing.
- Major refactorings.
- Renamed the package to flutter_field_validators.

# [v1.0.0] - 31.05.2022

- Initial release.