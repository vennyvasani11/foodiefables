import 'package:foodiefables/ui/home/state/home_controller.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(Get.find()));
  }
}
