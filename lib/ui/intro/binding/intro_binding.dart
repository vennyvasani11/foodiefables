


import 'package:foodiefables/ui/intro/state/intro_controller.dart';
import 'package:get/get.dart';


class IntroBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }

}