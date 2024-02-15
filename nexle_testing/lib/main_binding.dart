import 'package:get/get.dart';
import 'package:nexle_testing/services/api/api_respository.dart';
import 'package:nexle_testing/services/app_services/session_service.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiRepository>(ApiRepository(), permanent: true);
    Get.put<SessionService>(SessionService(), permanent: true);
  }
}
