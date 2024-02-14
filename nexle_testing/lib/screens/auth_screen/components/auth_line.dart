import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/screens/auth_screen/auth_controller.dart';

class AuthLine extends GetView<AuthController> {
  const AuthLine({
    super.key,
    this.value = 1.0,
    this.color = AppColor.deepDenim,
    this.backgroundColor,
  });

  final double value;
  final Color color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.5,
      child: LinearProgressIndicator(
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        value: value,
      ),
    );
  }
}
