import 'package:get/get.dart';
import 'package:nexle_testing/models/request/login_request.dart';
import 'package:nexle_testing/models/request/register_request.dart';
import 'package:nexle_testing/services/api/api_connect.dart';
import 'package:nexle_testing/services/api/api_endpoints.dart';

class ApiRepository extends ApiConnect {
  final ApiEndPoints _apiEndPoints = ApiEndPoints();

  Future<dynamic> singup(RegisterRequest request) async {
    final Response<dynamic> response =
        await post(_apiEndPoints.signup, request.toMap());

    return response;
  }

  Future<dynamic> singin(LoginRequest request) async {
    final Response<dynamic> response =
        await post(_apiEndPoints.signin, request.toMap());

    return response;
  }
}
