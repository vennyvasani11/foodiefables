


import 'package:foodiefables/ui/notification/state/notification_controller.dart';
import 'package:get/get.dart';


class NotificationBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }

}