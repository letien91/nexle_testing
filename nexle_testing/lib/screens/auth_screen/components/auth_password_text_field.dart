import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/components/input_field.dart';
import 'package:nexle_testing/constants/colors.dart';
import 'package:nexle_testing/constants/password_status.dart';
import 'package:nexle_testing/screens/auth_screen/auth_controller.dart';
import 'package:nexle_testing/screens/auth_screen/components/auth_line.dart';
import 'package:nexle_testing/screens/auth_screen/components/auth_validate_label.dart';
import 'package:nexle_testing/utils/common_components.dart';

class AuthPasswordTextField extends GetView<AuthController> {
  const AuthPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildTextField(),
        _buildPasswordStatusIndicator(),
        const SizedBox(height: 10),
        _buildPasswordStatusText(),
      ],
    );
  }

  Widget _buildTextField() {
    return InputField(
      controller: controller.passwordController,
      focusNode: controller.passwordForcusNode,
      keyboardType: TextInputType.text,
      labelText: 'Your password',
      isPassword: true,
      onChanged: (String value) {
        controller.onChangedPassword(value);
      },
      onFocusChange: (bool isFocus) {
        controller.startPassword(isFocus);
      },
    );
  }

  Widget _buildPasswordStatusIndicator() {
    // return AnimatedBuilder(
    //     animation: controller.passwordStrengthController,
    //     builder: (context, Widget? child) {
    //       print('xxxx: ${controller.passwordStrengthController.value}');
    //       return AuthLine(
    //         // value: controller.passwordStatus.value.strongLevel,
    //         value: controller.passwordStrengthController.value,
    //         backgroundColor: AppColor.fromHex('ffffff').withOpacity(0.42),
    //         color: controller.passwordStatus.value.color,
    //       );
    //     });

    return Obx(
      () => controller.passwordStart.value
          ? AuthLine(
              value: controller.passwordStatus.value.strongLevel,
              backgroundColor: AppColor.fromHex('ffffff').withOpacity(0.42),
              color: controller.passwordStatus.value.color,
            )
          : const AuthLine(value: 1.0),
    );
  }

  Widget _buildPasswordStatusText() {
    return Obx(() => CommonComp.setRegularText(
          textAlign: TextAlign.right,
          txt: controller.passwordStatus.value.text,
          color: controller.passwordStatus.value.color,
        ));
  }

  Widget _buildPasswordValidate() {
    return Obx(
      () => AuthValidateLabel(
        validate: controller.passwordValidate.value,
      ),
    );
  }
}
