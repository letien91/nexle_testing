import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/components/input_field.dart';
import 'package:nexle_testing/screens/auth_screen/auth_controller.dart';
import 'package:nexle_testing/screens/auth_screen/components/auth_line.dart';
import 'package:nexle_testing/screens/auth_screen/components/auth_validate_label.dart';

class AuthEmailTextField extends GetView<AuthController> {
  const AuthEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        InputField(
          controller: controller.emailController,
          focusNode: controller.emailForcusNode,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          labelText: 'Your email',
          onChanged: (String value) {
            controller.onChangedEmail(value);
          },
          onSubmitted: (String value) {
            FocusScope.of(context).requestFocus(controller.passwordForcusNode);
          },
        ),
        const AuthLine(),
        const SizedBox(height: 5),
        Obx(
          () => AuthValidateLabel(
            validate: controller.emailValidate.value,
          ),
        ),
      ],
    );
  }
}
