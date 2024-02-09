import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

FutureOr<dynamic> responseInterceptor(
    Request<dynamic> request, Response<dynamic> response) async {
  responseLogger(response);
  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response<dynamic> response) {
  return;
}

void responseLogger(Response<dynamic> response) {
  debugPrint('Status Code: ${response.statusCode}\n');
  debugPrint('Data: ${response.bodyString?.toString() ?? ''}');
}
