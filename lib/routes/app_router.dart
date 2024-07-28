import 'package:get/get.dart';

import '../ui/home/model/getAllCategoryData.dart';
import '../ui/home/model/getAllRecipeData.dart';
import 'app_page.dart';

class AppRouter {
  static splash() {
    Get.offAllNamed(Routes.SPLASH);
  }

  static onBoarding() {
    Get.toNamed(Routes.ONBOARDING);
  }

  static login() {
    Get.toNamed(Routes.LOGIN);
  }

  static cooking() {
    Get.toNamed(Routes.COOKING);
  }

  static foodCategory() {
    Get.toNamed(Routes.FOODCATEGORY);
  }

  static home(List<RecipeItem> allRecipeList, todayrecipeList,
      List<CategoryItem> allCategoryList) {
    Get.toNamed(
      Routes.HOME,
      arguments: {
        "allRecipeList": allRecipeList,
        "todayRecipeList": todayrecipeList,
        "allCategoryList": allCategoryList
      },
    );
  }

  static search(
    List<RecipeItem> allRecipeList,
  ) {
    Get.toNamed(
      Routes.SEARCH,
      arguments: {
        "allRecipeList": allRecipeList,
      },
    );
  }

  static homeDetailRoute(RecipeItem item) {
    Get.toNamed(Routes.HOMEDETAIL, arguments: {"item": item});
  }

  static notificationRoute() {
    Get.toNamed(
      Routes.NOTIFICATION,
    );
  }

  static savedRecipeRoute() {
    Get.toNamed(Routes.SAVED_RECIPE);
  }

  static profileRoute() {
    Get.toNamed(Routes.PROFILE);
  }

  static categoryRoute(
    List<RecipeItem> allRecipeList,
  ) {
    Get.toNamed(
      Routes.CATEGORY,
      arguments: {"allRecipeList": allRecipeList},
    );
  }

  // static pdfViewerRoute(GetJungleBookItem item) {
  //   Get.toNamed(Routes.PDF_VIEWER, arguments: {"item": item});
  // }

  // static sosAnimalRoute() {
  //   Get.toNamed(Routes.SOS_ANIMAL);
  // }

  // static volunterRoute() {
  //   Get.toNamed(Routes.VOLUNTER);
  // }

  // static memberRoute() {
  //   Get.toNamed(Routes.MEMBER);
  // }

  // static bookSeatRoute(ActivitydetailItem item) {
  //   Get.toNamed(Routes.BOOK_SEAT, arguments: {"item": item});
  // }

  // static thankYouRoute() {
  //   Get.offAndToNamed(Routes.THANKYOU);
  // }

  // static aboutRoute() {
  //   Get.toNamed(
  //     Routes.ABOUT,
  //   );
  // }
}
