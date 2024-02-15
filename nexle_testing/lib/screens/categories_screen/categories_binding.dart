import 'package:get/get.dart';
import 'package:nexle_testing/screens/categories_screen/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CategoriesController>(CategoriesController());
  }
}
