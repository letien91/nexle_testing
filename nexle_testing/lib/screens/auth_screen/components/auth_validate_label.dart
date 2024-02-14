import 'package:flutter/material.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/utils/common_components.dart';

class AuthValidateLabel extends StatelessWidget {
  const AuthValidateLabel({super.key, this.validate});
  final String? validate;

  @override
  Widget build(BuildContext context) {
    if (validate == null || validate!.isEmpty) {
      return const SizedBox();
    }
    return CommonComp.setRegularText(
      txt: validate ?? '',
      fontSize: 12,
      color: AppColor.flutshed,
    );
  }
}
