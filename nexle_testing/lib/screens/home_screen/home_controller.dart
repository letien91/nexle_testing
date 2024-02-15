import 'package:get/get.dart';
import 'package:nexle_testing/services/app_services/session_service.dart';

class HomeController extends GetxController {
  void logout() async {
    final SessionService sessionService = Get.find<SessionService>();
    sessionService.logout();
  }
}
