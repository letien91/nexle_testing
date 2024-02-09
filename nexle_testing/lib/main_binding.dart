import 'package:get/get.dart';
import 'package:nexle_testing/services/api/api_respository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiRepository>(ApiRepository(), permanent: true);
  }
}
