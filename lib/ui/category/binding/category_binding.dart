


import 'package:get/get.dart';


import '../state/category_controller.dart';


class CategoryBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }

}