import 'package:flutter/material.dart';
import 'package:foodiefables/ui/home/model/getAllRecipeData.dart';
import 'package:foodiefables/ui/home/state/home_controller.dart';
import 'package:get/get.dart';


import '../../home/model/getAllCategoryData.dart';

class CategoryController extends GetxController
    with GetTickerProviderStateMixin {
  AnimationController? animationController;
  AnimationController? animationController1;

  Animation<double>? topBarAnimation;

  final ScrollController scrollController = ScrollController();
  // double topBarOpacity = 0.0;

  late List<RecipeItem> recipeItem;
  dynamic argumentData = Get.arguments;
  var _allRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get allRecipeList => _allRecipeList.value;

var _categoryRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get categoryRecipeList => _categoryRecipeList.value;



  var _allCategoryList = RxList<CategoryItem>();
  List<CategoryItem> get allCategoryList => _allCategoryList.value;

  final _visible = false.obs;

  bool get visible => _visible.value;
  @override
  void onInit() {

    
    recipeItem = argumentData["allRecipeList"];
    _allRecipeList.value = recipeItem;

    final HomeController homeController = Get.find();
    _allCategoryList = homeController.allCategoryList.obs;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    topBarAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      curve: Interval((1 / 10) * 1, 1.0, curve: Curves.fastOutSlowIn),
    ));




     animationController1 = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.onInit();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void categoryFindData(String category) {
    for (var i = 0; i < allRecipeList.length; i++) {
      if (allRecipeList[i].category==category) {
        categoryRecipeList.add(allRecipeList[i]);
      }
    }
  }
}
