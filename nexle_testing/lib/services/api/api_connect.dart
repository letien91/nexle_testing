import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/services/api/api_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_endpoints.dart';

class ApiConnect extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiEndPoints.baseUrl;
    httpClient.addAuthenticator((Request<dynamic> request) async {
      final SharedPreferences storage = Get.find<SharedPreferences>();
      final String? token = storage.getString(kAuthorizationKey);
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      return request;
    });

    httpClient.addRequestModifier((Request<dynamic> request) {
      return request;
    });

    // httpClient.addResponseModifier(responseInterceptor);
  }
}
