import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:foodiefables/ui/splash/state/splash_controller.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../routes/app_router.dart';

class SplashRoute extends GetView<SplashController> {
  const SplashRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          BackgroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Foodie Fables",
                style: AppUtils.textWhiteRancho66,
              ),
              Center(
                child: Text(
                  "With us you remain healthy",
                  style: AppUtils.textWhitePoppinsLight9,
                ),
              )
            ],
          ),
          Visibility(
            visible: controller.allStatus.isSuccess,
            replacement: Positioned(
                bottom: 80,
                child: CircularProgressIndicator(
                  color: AppTheme.secondary,
                )),
            child: Positioned(
              bottom: 80,
              left: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  AppRouter.home(controller.allRecipeList,
                      controller.todayRecipeList, controller.allCategoryList);
                },
                child: Container(
                  // margin: EdgeInsets.all(20),
                  height: 60,
                  width: AppUtils.width(context),
                  decoration: BoxDecoration(
                      color: AppTheme.secondary,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Continue...",
                    style: AppUtils.textWhitePoppinsRegular24,
                  )),
                ),
              ),
            ),
          ),
        ],
      );
    }),bottomNavigationBar: bannerAD(),);
  }


  bannerAD(){  // aa function pase ads che jene jay call karavo tya ads aapse
  return SizedBox(
    height: 60, // adSize paramane chenge karvi pade
    child: AdWidget(
      ad: controller.ads.getBannerAd()..load(),  // AdWidget maj ads show thay mate ani ad proprty ne add aapi( ads ma getBannerAd maje ads che aane load karo ! )
      key: UniqueKey(),
    )
  );
}
}
