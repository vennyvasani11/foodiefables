import 'package:flutter/cupertino.dart';
import 'package:foodiefables/Repository/home_repository.dart';
import 'package:foodiefables/service/ad_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';
import '../../home/model/getAllCategoryData.dart';
import '../../home/model/getAllRecipeData.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final HomeRepository _homeRepository;

  SplashController(this._homeRepository);

    AnimationController? animationController;

  Animation<double>? topBarAnimation;

  final _status = Rx(RxStatus.empty());

  RxStatus get status => _status.value;


   final _status1 = Rx(RxStatus.empty());

  RxStatus get status1 => _status1.value;

     final _status2 = Rx(RxStatus.empty());

  RxStatus get status2 => _status2.value;

  final _allStatus = Rx(RxStatus.empty());

  RxStatus get allStatus => _allStatus.value;

  var _allRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get allRecipeList => _allRecipeList.value;

  var _todayRecipeList = RxList<RecipeItem>();
  List<RecipeItem> get todayRecipeList => _todayRecipeList.value;

    var _allCategoryList = RxList<CategoryItem>();
  List<CategoryItem> get allCategoryList => _allCategoryList.value;
AdHelper ads= AdHelper();   // Upar na class no object banavo ads name no

  @override
  void onInit() {
    getAllRecipe();
    getTodayRecipe();
    getAllCateogry();
       animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.onInit();
  }

    Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

@override
void onClose(){
    ads.getBannerAd()..dispose();
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
                  "filter": {}

          });

          debugPrint("Response ******>$response");
          _status.value = RxStatus.success();
          var obj = GetAllRecipeData.fromJson(response);

          if (obj.documents != null) {
            if (_allRecipeList.isEmpty) {
              _allRecipeList.value = obj.documents!;
              print(_allRecipeList.length);
              if (_status.value.isSuccess&&_status1.value.isSuccess&&_status2.value.isSuccess) {
                _allStatus.value = RxStatus.success();
              }
              // _postDisplayList.value = _postList;
              // homeTotal = obj.totalJobs ?? 0;
            } else {
              // _postList.addAll(obj.data!);
              // _postDisplayList.value = _postList;
            }
          }
        } catch (e) {
          print(e);
          AppUtils.toastMessage(e.toString());
          _status.value = RxStatus.error(e.toString());
        }
      } else {
        AppUtils.toastMessage('Please Check Internet.');
      }
    });
  }

getTodayRecipe() async {
    AppUtils.isConnected().then((intenet) async {
      if (intenet != null && intenet) {
        _status2.value = RxStatus.loading();
        try {
          final response = await _homeRepository.allRecipeCall(request: {
            "dataSource": Constants.data_source,
            "database": Constants.data_base,
            "collection": Constants.todayRecipe,
                  "filter": {}

          });

          debugPrint("Response ******>$response");
          _status2.value = RxStatus.success();
          var obj = GetAllRecipeData.fromJson(response);

          if (obj.documents != null) {
            if (_todayRecipeList.isEmpty) {
              _todayRecipeList.value = obj.documents!;
              print(_todayRecipeList.length);
                           if (_status.value.isSuccess&&_status1.value.isSuccess&&_status2.value.isSuccess) {

                _allStatus.value = RxStatus.success();
              }
              // _postDisplayList.value = _postList;
              // homeTotal = obj.totalJobs ?? 0;
            } else {
              // _postList.addAll(obj.data!);
              // _postDisplayList.value = _postList;
            }
          }
        } catch (e) {
          print(e);
          AppUtils.toastMessage(e.toString());
          _status.value = RxStatus.error(e.toString());
        }
      } else {
        AppUtils.toastMessage('Please Check Internet.');
      }
    });
  }


  getAllCateogry() async {
    AppUtils.isConnected().then((intenet) async {
      if (intenet != null && intenet) {
        _status1.value = RxStatus.loading();
        try {
          final response = await _homeRepository.allRecipeCall(request: {
            "dataSource": Constants.data_source,
            "database": Constants.data_base,
            "collection": Constants.category,
                  "filter": {}

          });

          debugPrint("Response ******>$response");
          _status1.value = RxStatus.success();
          var obj = GetAllCategoryData.fromJson(response);

          if (obj.documents != null) {
            if (_allCategoryList.isEmpty) {
              _allCategoryList.value = obj.documents!;
              print(_allCategoryList.length);
              if (_status.value.isSuccess&&_status1.value.isSuccess&&_status2.value.isSuccess) {
                _allStatus.value = RxStatus.success();
              }
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
}
