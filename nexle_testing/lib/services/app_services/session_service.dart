import 'package:get/get.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/models/user.dart';
import 'package:nexle_testing/routes/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService extends GetxService {
  User account = User();
  String? accessToken;
  String? refreshToken;

  void setUser(User user) {
    if (user.id == null) {
      return;
    }
    account = user;
  }

  Future<void> logout() async {
    final SharedPreferences preferences = Get.find<SharedPreferences>();
    await Future.wait(<Future<bool>>[
      preferences.remove(kAuthorizationKey),
      preferences.remove(kUserCategoriesKey),
    ]);
    account = User();
    accessToken = null;
    refreshToken = null;

    Get.offNamed(RoutesName.auth);
  }
}
