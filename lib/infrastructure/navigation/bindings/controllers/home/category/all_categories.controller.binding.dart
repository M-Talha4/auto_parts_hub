import 'package:get/get.dart';

import '../../../../../../presentation/dashboard/home/all_categories/controllers/all_categories.controller.dart';

class AllCategoriesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCategoriesController>(
      () => AllCategoriesController(),
    );
  }
}
