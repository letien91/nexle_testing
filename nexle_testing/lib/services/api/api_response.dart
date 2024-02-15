import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> responseInterceptor(
    Request<dynamic> request, Response<dynamic> response) async {
  //?
  if (response.statusCode != 200 && response.statusCode != 201) {
    handleErrorStatus(response);
  }

  return response;
}

void handleErrorStatus(Response<dynamic> response) {
  Get.showSnackbar(GetSnackBar(
    title: 'Error ${response.statusCode}',
    message: response.bodyString?.toString() ?? '',
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 200),
  ));
}
