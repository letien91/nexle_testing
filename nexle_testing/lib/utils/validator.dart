import 'package:nexle_testing/constants/password_status.dart';

class Validator {
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'The email is required';
    }

    const String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return 'The email is not valid';
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'The password is required';
    }
    if (password.length < 6 || password.length > 18) {
      return 'The password must be between 6-18 characters';
    }
    return null;
  }

  PasswordStatus passwordStatus(String? password) {
    if (password == null || password.isEmpty) {
      return PasswordStatus.none;
    }

    const String weakAlphaUpper = r'^[A-Z]+$';
    if (_checkPattern(pattern: weakAlphaUpper, password: password)) {
      return PasswordStatus.weak;
    }

    const String weakAlphaLower = r'^[a-z]+$';
    if (_checkPattern(pattern: weakAlphaLower, password: password)) {
      return PasswordStatus.weak;
    }

    const String weakNumber = r'^[0-9]+$';
    if (_checkPattern(pattern: weakNumber, password: password)) {
      return PasswordStatus.weak;
    }

    const String fairPattern = r'^[a-zA-Z]+$';
    if (_checkPattern(pattern: fairPattern, password: password)) {
      return PasswordStatus.fair;
    }

    const String goodPattern = r'^[a-zA-Z0-9]+$';
    if (_checkPattern(pattern: goodPattern, password: password)) {
      return PasswordStatus.good;
    }

    // const String strongPattern = r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
    //     "'"
    //     ']';
    const String strongPattern =
        r'^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%\^&*()-_+=\[\]{}\\|;:\",<.>/?`~'
        "'"
        ']';
    if (_checkPattern(pattern: strongPattern, password: password)) {
      return PasswordStatus.strong;
    }

    return PasswordStatus.weak;
  }

  bool _checkPattern({required String pattern, required String password}) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }
}
