


import 'package:foodiefables/ui/search/state/search_controller.dart';
import 'package:get/get.dart';



class SearchBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<SearchRouteController>(() => SearchRouteController(Get.find()));
  }

}