import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../routes/app_router.dart';
import '../../../utils/Constant.dart';
import '../model/intro_data.dart';

class IntroController extends GetxController {
  List<String> image = [
    "${Constants.assetImage}ic_onboarding_1.svg",
    "${Constants.assetImage}ic_onboarding_2.svg",
    "${Constants.assetImage}ic_onboarding_3.svg",
  ];

  List<IntroData> dataList = [
    IntroData(
        "Choose Your \nFavorite Food",
        "Vegetarian Meat / Dishes\npasta Dishes / salads /\nDesserts /Soups / Seafood",
        "${Constants.assetImage}ic_onboarding_1.svg",
        1),
    IntroData(
        "Delicious \nFood Menu",
        "Vegetarian Meat / Dishes\nDesserts /Soups / Seafood",
        "${Constants.assetImage}ic_onboarding_2.svg",
        2),
    IntroData(
        "we have 2000+\nRecipe On Our App",
        "Vegetarian Meat / Dishes\n pasta Dishes / salads /\nDesserts /Soups / Seafood",
        "${Constants.assetImage}ic_onboarding_3.svg",
        3),
    IntroData(
        "Welcome to TasteMates",
        "Hi, I am here  to help you find and try \nany recipes you want.",
        "${Constants.assetImage}ic_onboarding_4.svg",
        4),
  ];
  final _slide = 0.obs;
  int get slide => _slide.value;

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  var corosoulcontroller = CarouselController();

  void nextPage() {
    if (_selectedIndex == dataList.length - 1) {
      // PreferenceUtils.setBool(
      //     Constants.isIntroDone, true);
      AppRouter.login();
    } else {
      _selectedIndex.value++;
      _slide.value++;
      corosoulcontroller.animateToPage(_selectedIndex.value,
          duration: Duration(milliseconds: 1000), curve: Curves.linear);
    }
  }

  void increment(int index) {
    _selectedIndex.value = index;
    _slide.value = index;
  }
}
