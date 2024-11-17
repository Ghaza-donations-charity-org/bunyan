import 'package:ghaza_donations_app/features/authentication/controller/password_checker.dart';

PasswordChecker passwordHasMoreThan6Characters = PasswordChecker(
  label: 'More than 6 characters',
);
PasswordChecker passwordContainsUpperLetter = PasswordChecker(
  label: 'Contains a uppercase letter',
);
PasswordChecker passwordContainsLowerLetter = PasswordChecker(
  label: 'Contains a lowercase letter',
);
PasswordChecker passwordContainsNumericDigit = PasswordChecker(
  label: 'Contains a numeric digit',
);
PasswordChecker passwordContainsSpecialCharacter = PasswordChecker(
  label: 'Contains a special character',
);

List<PasswordChecker> passwordCheckers = [
  passwordHasMoreThan6Characters,
  passwordContainsUpperLetter,
  passwordContainsLowerLetter,
  passwordContainsNumericDigit,
  passwordContainsSpecialCharacter
];
