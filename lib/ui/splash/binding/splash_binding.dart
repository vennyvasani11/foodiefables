
import 'package:foodiefables/ui/splash/state/splash_controller.dart';
import 'package:get/get.dart';



class SplashBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(Get.find()));
  }

}