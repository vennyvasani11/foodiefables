import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodiefables/Repository/home_repository.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:foodiefables/provider/home_provider.dart';
import 'package:foodiefables/routes/app_page.dart';
import 'package:foodiefables/service/firebase_push.dart';
import 'package:foodiefables/ui/home/state/home_controller.dart';
import 'package:foodiefables/ui/home_detail/binding/home_detail_binding.dart';
import 'package:foodiefables/ui/intro/binding/intro_binding.dart';
import 'package:foodiefables/ui/intro/state/intro_controller.dart';
import 'package:foodiefables/ui/saved_recipe/state/saved_recipe_conrtoller.dart';
import 'package:foodiefables/ui/splash/binding/splash_binding.dart';
import 'package:foodiefables/ui/splash/state/splash_controller.dart';
import 'package:foodiefables/ui/splash/view/splash_route.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/prefutils.dart';
import 'package:get/get.dart';

import 'package:foodiefables/ui/category/binding/category_binding.dart';

import 'package:foodiefables/ui/home/binding/home_binding.dart';

import 'package:foodiefables/ui/intro/view/onboarding.dart';
import 'package:foodiefables/ui/login/binding/login_binding.dart';
import 'package:foodiefables/ui/notification/binding/notification_binding.dart';
import 'package:foodiefables/ui/profile/binding/profile_binding.dart';
import 'package:foodiefables/ui/saved_recipe/binding/saved_recipe_biinding.dart';
import 'package:foodiefables/ui/search/binding/search_binding.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await PushNotificationService().setupInteractedMessage();

  await PreferenceUtils.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  bool login = PreferenceUtils.getBool(Constants.isLoginDone) ?? false;
  bool intro = PreferenceUtils.getBool(Constants.isIntroDone) ?? false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:(login&&intro)?SplashRoute(): OnboardingRoute(),
      // initialRoute: AppPages.initial(),
      getPages: AppPages.routes,theme: AppTheme.light,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<HomeProvider>(() => HomeProvider(), fenix: true);
        Get.lazyPut<HomeRepository>(() => HomeRepository(Get.find()),
            fenix: true);
        Get.lazyPut<IntroBinding>(() => IntroBinding(), fenix: true);
        Get.lazyPut<HomeDetailBinding>(() => HomeDetailBinding(), fenix: true);
        Get.lazyPut<NotificationBinding>(() => NotificationBinding(),
            fenix: true);
        Get.lazyPut<SavedRecipeBinding>(() => SavedRecipeBinding(),
            fenix: true);
        Get.lazyPut<LoginBinding>(() => LoginBinding(), fenix: true);

        Get.lazyPut<HomeBinding>(() => HomeBinding(), fenix: true);
        Get.lazyPut<SearchBinding>(() => SearchBinding(), fenix: true);

        Get.lazyPut<ProfileBinding>(() => ProfileBinding(), fenix: true);

        Get.lazyPut<CategoryBinding>(() => CategoryBinding(), fenix: true);

        Get.lazyPut<SavedRecipeController>(() => SavedRecipeController(),
            fenix: true);
        Get.lazyPut<HomeController>(() => HomeController(Get.find()),
            fenix: true);


        Get.lazyPut<IntroController>(() => IntroController(), fenix: true);

        Get.lazyPut<SplashBinding>(() => SplashBinding(), fenix: true);

        Get.lazyPut<SplashController>(() => SplashController(Get.find()),
            fenix: true);
      }),
    );
  }
}
