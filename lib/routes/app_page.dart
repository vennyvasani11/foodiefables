import 'package:foodiefables/ui/category/binding/category_binding.dart';
import 'package:foodiefables/ui/category/view/category_route.dart';
import 'package:foodiefables/ui/cooking/view/cooking_route.dart';
import 'package:foodiefables/ui/home/binding/home_binding.dart';
import 'package:foodiefables/ui/home/view/home_route.dart';
import 'package:foodiefables/ui/home_detail/view/home_detail_route.dart';
import 'package:foodiefables/ui/intro/view/onboarding.dart';
import 'package:foodiefables/ui/login/binding/login_binding.dart';
import 'package:foodiefables/ui/login/view/login_route.dart';
import 'package:foodiefables/ui/notification/binding/notification_binding.dart';
import 'package:foodiefables/ui/notification/view/notification_route.dart';
import 'package:foodiefables/ui/profile/binding/profile_binding.dart';
import 'package:foodiefables/ui/profile/view/profile_route.dart';
import 'package:foodiefables/ui/saved_recipe/binding/saved_recipe_biinding.dart';
import 'package:foodiefables/ui/saved_recipe/view/saved_recipe_route.dart';
import 'package:foodiefables/ui/search/binding/search_binding.dart';
import 'package:foodiefables/ui/search/view/search_route.dart';
import 'package:get/get.dart';
import '../ui/food_category/view/food_category_route.dart';
import '../ui/home_detail/binding/home_detail_binding.dart';
import '../ui/splash/binding/splash_binding.dart';
import '../ui/splash/view/splash_route.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static initial() {
    return Routes.HOME;
  }

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingRoute(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashRoute(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginRoute(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.COOKING,
      page: () => const CookingRoute(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FOODCATEGORY,
      page: () => FoodCategoryRoute(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeRoute(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchRoute(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.HOMEDETAIL,
      page: () => const HomeDetailRoute(),
      binding: HomeDetailBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationRoute(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SAVED_RECIPE,
      page: () => SavedRecipeRoute(),
      binding: SavedRecipeBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryRoute(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileRoute(),
      binding: ProfileBinding(),
    ),
    // GetPage(
    //   name: _Paths.GALLERY,
    //   page: () =>const GalleryRoute(),
    //   binding: GalleryBinding(),
    // ),
    // GetPage(
    //   name: _Paths.GALLERY_ALBUM,
    //   page: () =>AlbumRoute(),
    //   binding: GalleryAlbumBinding(),
    // ),
    // GetPage(
    //   name: _Paths.JUNGLEBOOK,
    //   page: () => const JungleRoute(),
    //   binding: JungleBookBinding(),
    // ),
    // GetPage(
    //   name: _Paths.PDF_VIEWER,
    //   page: () => const PdfViewerRoute(),
    //   binding: PdfviewBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SOS_ANIMAL,
    //   page: () =>  SosRoute(),
    //   binding: SosBinding(),
    // ),
    // GetPage(
    //   name: _Paths.VOLUNTER,
    //   page: () =>const VolunterRoute(),
    //   binding: VolunterBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MEMBER,
    //   page: () => MemberRoute(),
    //   binding: MemberBinding(),
    // ),
    // GetPage(
    //   name: _Paths.THANKYOU,
    //   page: () => const ThankYouRoute(),
    //   // binding: JobApplierProfileBinding(),
    // ),
    // GetPage(
    //   name: _Paths.BOOK_SEAT,
    //   page: () => BookSeatRoute(),
    //   binding: SeatBookingBinding(),
    // ),
  ];
}
