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

    const String strongPattern =
        r'^(?=.*[a-z]{1,})(?=.*[A-Z]{1,})(?=.*?[\d]{1,})(?=.*?[\W]{1,}).*$';

    if (_checkPattern(pattern: strongPattern, password: password)) {
      return PasswordStatus.strong;
    }

    const String goodPattern =
        r'^(?=.*[a-z]{1,})(?=.*[A-Z]{1,})(?=.*?[\d]{1,}).*$';
    if (_checkPattern(pattern: goodPattern, password: password)) {
      return PasswordStatus.good;
    }

    const String fairPattern = r'^(?=.*[a-z]{1,})(?=.*[A-Z]{1,}).*$';
    if (_checkPattern(pattern: fairPattern, password: password)) {
      return PasswordStatus.fair;
    }

    return PasswordStatus.weak;
  }

  bool _checkPattern({required String pattern, required String password}) {
    final RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }
}
