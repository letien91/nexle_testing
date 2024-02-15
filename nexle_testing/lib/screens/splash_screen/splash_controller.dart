import 'package:get/get.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();

    final SharedPreferences preferences = Get.find<SharedPreferences>();
    final String? token = preferences.getString(kAuthorizationKey);
    Get.offAllNamed(token != null ? RoutesName.home : RoutesName.auth);
  }
}
