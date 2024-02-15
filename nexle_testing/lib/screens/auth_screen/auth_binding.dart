import 'package:get/get.dart';
import 'package:nexle_testing/screens/auth_screen/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
