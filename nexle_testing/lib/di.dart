import 'package:get/get.dart';
import 'package:nexle_testing/services/storage_manager.dart';

class DependenceInjection {
  Future<void> init() async {
    await Get.putAsync(() => StorageManager().init());
  }
}
