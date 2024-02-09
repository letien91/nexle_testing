import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexle_testing/services/api/api_respository.dart';

class AuthController extends GetxController {
  AuthController({required this.apiRepository});

  final ApiRepository apiRepository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
