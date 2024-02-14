import 'package:flutter/material.dart';
import 'package:nexle_testing/constants/colors.dart';

enum PasswordStatus {
  none,
  tooShort,
  tooLong,
  weak,
  fair,
  good,
  strong,
}

extension PasswordStatusEx on PasswordStatus {
  String get text {
    switch (this) {
      case PasswordStatus.weak:
        return 'Weak';
      case PasswordStatus.fair:
        return 'Fair';
      case PasswordStatus.good:
        return 'Good';
      case PasswordStatus.strong:
        return 'Strong';
      case PasswordStatus.tooShort:
        return 'Too short';
      case PasswordStatus.tooLong:
        return 'Too long';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case PasswordStatus.weak:
        return AppColor.flutshed;
      case PasswordStatus.fair:
        return AppColor.indiaTrade;
      case PasswordStatus.good:
        return AppColor.deepDenim;
      case PasswordStatus.strong:
        return AppColor.algaeGreen;
      default:
        return Colors.white.withOpacity(0.5);
    }
  }

  double get strongLevel {
    switch (this) {
      case PasswordStatus.weak:
        return 1.0 / 4.0;
      case PasswordStatus.fair:
        return 2.0 / 4.0;
      case PasswordStatus.good:
        return 3.0 / 4.0;
      case PasswordStatus.strong:
        return 4.0 / 4.0;
      default:
        return 0.0;
    }
  }
}
