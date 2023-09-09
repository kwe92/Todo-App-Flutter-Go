import 'package:flutter_golang_yt/declarations.dart';

class StringValidatorConfiguration {
  final bool notEmpty;
  final bool includesUppercase;
  final bool includesLowercase;
  final bool includesSpecial;
  final bool includesNumber;
  const StringValidatorConfiguration({
    this.notEmpty = false,
    this.includesUppercase = false,
    this.includesLowercase = false,
    this.includesSpecial = false,
    this.includesNumber = false,
  });
}

class StringService {
  const StringService();

  /// Custom validator returns a callback that looks for specific features in a string
  /// Specify the things you want (notEmpty, containsUppercase, etc)
  StringValidatorCallback customValidator(
    String value, {
    String label = 'Value',
    StringValidatorConfiguration configuration = const StringValidatorConfiguration(),
  }) =>
      (value) {
        if (configuration.notEmpty && (value == null || value.trim() == '')) {
          return '$label can not be empty.';
        }
        return null;
      };

  bool isEmpty(value) {
    return (value == null || value.trim() == '');
  }

  bool containsUppercase(String? value) {
    return RegExp(r'(?=.*[A-Z])').hasMatch(value ?? '');
  }

  bool containsLowercase(String? value) {
    return RegExp(r'(?=.*[a-z])').hasMatch(value ?? '');
  }

  bool containsNumber(String? value) {
    return RegExp(r'(?=.*?[0-9])').hasMatch(value ?? '');
  }

  bool containsSpecialCharacter(String? value) {
    return RegExp('[^a-zA-Z0-9d]').hasMatch(value ?? '');
  }

  bool contains8Characters(String? value) {
    return (value ?? '').length >= 8;
  }
}
