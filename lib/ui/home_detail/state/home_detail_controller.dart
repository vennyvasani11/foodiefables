import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../routes/app_router.dart';
import '../../../utils/Constant.dart';
import '../../home/model/getAllRecipeData.dart';
import '../model/nutritionListData.dart';

class HomeDetailController extends GetxController
    with GetTickerProviderStateMixin {
  dynamic argumentData = Get.arguments;

  final _openBox = true.obs;
  bool get openBox => _openBox.value;

  final _quantityIncrement = 1.obs;
  int get quantityIncrement => _quantityIncrement.value;




  var _nutritionDisplayList = RxList<NutritionListData>();
  List<NutritionListData> get nutritionDisplayList =>
      _nutritionDisplayList.value;

  final _ingredientsVisible = false.obs;
  bool get ingredientsVisible => _ingredientsVisible.value;

  final _nutritionVisible = false.obs;
  bool get nutritionVisible => _nutritionVisible.value;
  AnimationController? animationController;

  Animation<double>? topBarAnimation;

  late RecipeItem item;

  @override
  void onInit() {
    item = argumentData["item"];

    _nutritionDisplayList
        .add(NutritionListData("Fiber", item.nutrition!.fiber.toString()));
    _nutritionDisplayList
        .add(NutritionListData("Fat", item.nutrition!.fat.toString()));
    _nutritionDisplayList
        .add(NutritionListData("Protein", item.nutrition!.protein.toString()));
    _nutritionDisplayList
        .add(NutritionListData("Calories", item.nutrition!.calories.toString()));
    _nutritionDisplayList
        .add(NutritionListData("Sugar", item.nutrition!.sugar.toString()));
    _nutritionDisplayList
        .add(NutritionListData("Carbs", item.nutrition!.carbohydrates.toString()));

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    topBarAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      curve: Interval((1 / 10) * 1, 1.0, curve: Curves.fastOutSlowIn),
    ));
    super.onInit();
  }

  List<String> nutritionList = [
    "Fiber",
    "Fat",
    "Protein",
    "Calories",
    "Sugar",
    "Carbs"
  ];

  void boxOpen(double position) {
    if (position == 0.0) {
      _openBox.value = false;
    } else {
      _openBox.value = true;
    }
  }

  void ingredientvisible() {
    _ingredientsVisible.value = !_ingredientsVisible.value;
  }

  void nutritionvisible() {
    _nutritionVisible.value = !_nutritionVisible.value;
  }

  void decrement() {
if(quantityIncrement>0)

    _quantityIncrement.value--;
  }

  void increment() {
        _quantityIncrement.value++;

  }
}
