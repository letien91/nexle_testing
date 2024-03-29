import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/constants/password_status.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/models/request/login_request.dart';
import 'package:nexle_testing/models/request/register_request.dart';
import 'package:nexle_testing/models/response/login_response.dart';
import 'package:nexle_testing/routes/routes_name.dart';
import 'package:nexle_testing/services/api/api_respository.dart';
import 'package:nexle_testing/services/app_services/session_service.dart';
import 'package:nexle_testing/utils/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthController();

  final ApiRepository apiRepository = Get.find<ApiRepository>();

  final Validator _validator = Validator();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailForcusNode = FocusNode();
  final FocusNode passwordForcusNode = FocusNode();

  Rx<String?> emailValidate = (null as String?).obs;
  Rx<String?> passwordValidate = (null as String?).obs;

  Rx<PasswordStatus> passwordStatus = PasswordStatus.none.obs;
  Rx<bool> passwordFocus = false.obs;
  Rx<bool> passwordStart = false.obs;

  Rx<bool> isCheckedTAS = false.obs;
  Rx<bool> isGoodForm = false.obs;

  void onChangedEmail(String email) {
    emailValidate.value =
        email.isEmpty ? null : _validator.validateEmail(email);
    _checkGoodForm();
  }

  void onChangedPassword(String? password) {
    _checkGoodForm();
    if (password == null || password.isEmpty) {
      passwordStatus.value = PasswordStatus.none;
      return;
    }
    if (password.length < 6) {
      passwordStatus.value = PasswordStatus.tooShort;
      return;
    }
    if (password.length > 18) {
      passwordStatus.value = PasswordStatus.tooLong;
      return;
    }

    final PasswordStatus ps = _validator.passwordStatus(password);
    passwordStatus.value = ps;
  }

  void _checkGoodForm() {
    final bool isEnteredEmail =
        _validator.validateEmail(emailController.text) == null;
    final bool isGoodPassword =
        _validator.validatePassword(passwordController.text) == null;
    isGoodForm.value = isEnteredEmail && isGoodPassword;
  }

  void startPassword(bool isFocus) {
    passwordStart.value =
        (isFocus == true || passwordController.text.isNotEmpty);
  }

  void onCheckTaS() {
    isCheckedTAS.value = !isCheckedTAS.value;
  }

  Future<void> onSubmitted() async {
    if (!isGoodForm.value) {
      return;
    }
    emailValidate.value = _validator.validateEmail(emailController.text);
    passwordValidate.value =
        _validator.validatePassword(passwordController.text);

    final bool isGoodValidate =
        emailValidate.value == null || passwordValidate.value == null;
    if (!isGoodValidate) {
      return;
    }

    EasyLoading.show();

    final bool registerSuccess = await _resiger();
    if (!registerSuccess) {
      EasyLoading.dismiss();
      return;
    }

    final bool loginSuccess = await _login();
    if (!loginSuccess) {
      EasyLoading.dismiss();
      return;
    }

    EasyLoading.dismiss();
    Get.toNamed(RoutesName.categories);
  }

  Future<bool> _resiger() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    final RegisterRequest registerRequest = RegisterRequest(
      email: email,
      password: password,
      firstName: 'Tester',
      lastName: 'Mr',
    );
    final Response<dynamic> registerRes =
        await apiRepository.singup(registerRequest);
    if (registerRes.statusCode == 201) {
      return true;
    }
    _showSnackbar(registerRes);
    return false;
  }

  Future<bool> _login() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    final LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    final Response<dynamic> loginRes = await apiRepository.singin(loginRequest);
    if (loginRes.statusCode == 200) {
      final LoginResponse loginresponse = LoginResponse.fromMap(loginRes.body);
      final SessionService sessionService = Get.find<SessionService>();
      sessionService.setUser(loginresponse.user);
      sessionService.accessToken = loginresponse.accessToken;
      sessionService.refreshToken = loginresponse.refreshToken;

      final SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
      sharedPreferences.setString(kAuthorizationKey, loginresponse.accessToken);
      return true;
    }
    _showSnackbar(loginRes);
    return false;
  }

  void _showSnackbar(Response<dynamic> response) {
    String message = 'Something went wrong';
    if (response.bodyString != null) {
      final Map<String, dynamic> errMap =
          Map<String, dynamic>.from(jsonDecode(response.bodyString!));
      message = errMap.containsKey('message')
          ? errMap['message']
          : 'Something went wrong';
    }

    Get.showSnackbar(GetSnackBar(
      title: 'Error ${response.statusCode}',
      message: message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 200),
    ));
  }
}
