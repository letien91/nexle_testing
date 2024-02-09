import 'package:get/get.dart';
import 'package:nexle_testing/screens/splash_screen/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
