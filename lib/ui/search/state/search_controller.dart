import 'package:flutter/material.dart';
import 'package:foodiefables/Repository/home_repository.dart';
import 'package:foodiefables/ui/home/model/getAllRecipeData.dart';
import 'package:foodiefables/ui/search/model/GetPopularCategoryData.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:get/get.dart';

class SearchRouteController extends GetxController
    with GetTickerProviderStateMixin {

        final HomeRepository _homeRepository;

  SearchRouteController(this._homeRepository);
  AnimationController? animationController;

  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
TextEditingController homeController=TextEditingController();
  dynamic argumentData = Get.arguments;
  late List<RecipeItem> recipeItem;
   final _status1 = Rx(RxStatus.empty());

  RxStatus get status1 => _status1.value;
  var _allRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get allRecipeList => _allRecipeList.value;

  var _displayRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get displayRecipeList => _displayRecipeList.value;

    var _popularCategoryList = RxList<PopluarItem>();
  List<PopluarItem> get popularCategoryList => _popularCategoryList.value;

  final _topBarOpacity = 0.0.obs;
  double get topBarOpacity => _topBarOpacity.value;
  int count = 9;

  final _visible = false.obs;
  bool get visible => _visible.value;
  @override
  void onInit() {
    getPopularCateogry();
    recipeItem = argumentData["allRecipeList"];
    _allRecipeList.value = recipeItem;

    debugPrint(_allRecipeList.length.toString());
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



 getPopularCateogry() async {
    AppUtils.isConnected().then((intenet) async {
      if (intenet != null && intenet) {
        _status1.value = RxStatus.loading();
        try {
          final response = await _homeRepository.allRecipeCall(request: {
            "dataSource": Constants.data_source,
            "database": Constants.data_base,
            "collection": Constants.popularCategory,
                  "filter": {}

          });

          debugPrint("Response ******>$response");
          _status1.value = RxStatus.success();
          var obj = GetPopularCategoryData.fromJson(response);

          if (obj.documents != null) {
            if (_popularCategoryList.isEmpty) {
              _popularCategoryList.value = obj.documents??[];
              print(_popularCategoryList.length);
             
              // _postDisplayList.value = _postList;
              // homeTotal = obj.totalJobs ?? 0;
            } else {
              // _postList.addAll(obj.data!);
              // _postDisplayList.value = _postList;
            }
          }
        } catch (e) {
          AppUtils.toastMessage(e.toString());
          _status1.value = RxStatus.error(e.toString());
        }
      } else {
        AppUtils.toastMessage('Please Check Internet.');
      }
    });
  }



  void changeValue(String value) {
    var list = <RecipeItem>[];
    if (value.isNotEmpty) {
      for (var item in _allRecipeList) {
        if ((item.name ?? "").toLowerCase().contains(value.toLowerCase())) {
          list.add(item);
        }
      }
      _displayRecipeList.value = list;
    } else {
      _displayRecipeList.value = [];
    }
  }

  void clearData() {
    _displayRecipeList.clear();
    homeController.clear();
    _displayRecipeList.refresh();
    
  }
}
