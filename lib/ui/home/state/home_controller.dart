import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodiefables/ui/home/model/getAllRecipeData.dart';
import 'package:foodiefables/ui/home/view/fresh_recipe_title.dart';
import 'package:foodiefables/ui/home/view/fresh_recipe_view.dart';
import 'package:foodiefables/ui/home/view/recipe_view.dart';
import 'package:foodiefables/ui/home/view/text_line.dart';
import 'package:foodiefables/ui/home/view/title_view.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:get/get.dart';

import '../../../Repository/home_repository.dart';
import '../../../utils/app_utils.dart';
import '../model/getAllCategoryData.dart';
import '../view/category_view.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  HomeRepository _homeRepository;
  HomeController(
    this._homeRepository,
  );

  dynamic argumentData = Get.arguments;
  late List<RecipeItem> recipeItem;
  late List<RecipeItem> todayRecipeItem;

  late List<CategoryItem> categoryItem;

  AnimationController? animationController;

  Animation<double>? topBarAnimation;

  AnimationController? flotingActionController;

  Animation<double>? flotingActionAnimation;

  var _listViews = RxList<Widget>();
  List<Widget> get listViews => _listViews.value;

  var _allCategoryList = RxList<CategoryItem>();
  List<CategoryItem> get allCategoryList => _allCategoryList.value;

  final ScrollController scrollController = ScrollController();

  final _topBarOpacity = 0.0.obs;
  double get topBarOpacity => _topBarOpacity.value;

  int count = 9;

  final _status = Rx(RxStatus.empty());
  RxStatus get status => _status.value;

  var _allRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get allRecipeList => _allRecipeList.value;

  var _sortRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get sortRecipeList => _sortRecipeList.value;
  var _todayRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get todayRecipeList => _todayRecipeList.value;

  final _visible = false.obs;
  bool get visible => _visible.value;

  var _number = RxList<int>();
  List<int> get number => _number.value;

  final Random _random = Random();
  final _randomNumber = 0.obs;
  int get randomNumber => _randomNumber.value;
  void generateRandomNumber(int length) {
    _randomNumber.value = 1 + _random.nextInt(length);
    _number.add(_randomNumber.value);
    _number.refresh();
  }

  @override
  void onInit() {
    recipeItem = argumentData["allRecipeList"];
    _allRecipeList.value = recipeItem;
    for (var i = 0; i < 100; i++) {
      if (_number.length < 25) {
        generateRandomNumber(recipeItem.length-6);
      }
      for (var i = 0; i < number.length; i++) {
        _sortRecipeList.add(recipeItem[number[i]]);
        print(number[i]);
      }
      // _allRecipeList.add(recipeItem[i]);
    }
    todayRecipeItem = argumentData["todayRecipeList"];
    _todayRecipeList.value = todayRecipeItem;
    debugPrint(_todayRecipeList.length.toString());
    categoryItem = argumentData["allCategoryList"];
    _allCategoryList.value = categoryItem;

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)));

    flotingActionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    flotingActionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: flotingActionController!,
            curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    allDataList();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          _topBarOpacity.value = 1.0;
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          _topBarOpacity.value = scrollController.offset / 24;
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          _topBarOpacity.value = 0.0;
        }
      }
    });
    super.onInit();
  }

  getAllRecipe() async {
    AppUtils.isConnected().then((intenet) async {
      if (intenet != null && intenet) {
        _status.value = RxStatus.loading();
        try {
          final response = await _homeRepository.allRecipeCall(request: {
            "dataSource": Constants.data_source,
            "database": Constants.data_base,
            "collection": Constants.recipe,
          });

          debugPrint("Response ******>$response");
          _status.value = RxStatus.success();
          var obj = GetAllRecipeData.fromJson(response);

          if (obj.documents != null) {
            if (_allRecipeList.isEmpty) {
              _allRecipeList.value = obj.documents!;
              print(_allRecipeList.length);

              // _postDisplayList.value = _postList;
              // homeTotal = obj.totalJobs ?? 0;
            } else {
              // _postList.addAll(obj.data!);
              // _postDisplayList.value = _postList;
            }
          }
        } catch (e) {
          AppUtils.toastMessage(e.toString());
          _status.value = RxStatus.error(e.toString());
        }
      } else {
        AppUtils.toastMessage('Please Check Internet.');
      }
    });
  }

  allDataList() {
    _listViews.add(TextLine(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController,
    ));

    _listViews.add(TitleView(
      flag: "category",
      titleTxt: 'Category',
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController,
    ));

    _listViews.add(CategoryListview(
      categoryList: _allCategoryList,
      mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: animationController!,
              curve:
                  Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
      mainScreenAnimationController: animationController,
    ));
    _listViews.add(FreshRecipetitle(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController,
    ));

    _listViews.add(FreshrecipeView(
      categoryList: _todayRecipeList,
      mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: animationController!,
              curve:
                  Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
      mainScreenAnimationController: animationController,
    ));
    _listViews.add(TitleView(
      flag: "recipe",
      titleTxt: 'Recommended',
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: animationController!,
          curve: Interval((1 / count) * 6, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: animationController,
    ));

    _listViews.add(RecipeView(
      recipeList: _sortRecipeList,
      mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: animationController!,
              curve: Interval((1 / count) * 7, 1.0, curve: Curves.linear))),
      mainScreenAnimationController: animationController,
    ));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  void chaged() {
    _visible.value = !_visible.value;
  }
}
