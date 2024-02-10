import 'package:flutter/material.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/ui/home/state/home_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


import '../../../utils/app_utils.dart';

class TitleView extends GetView<HomeController> {
  final String titleTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String flag;

  const TitleView(
      {Key? key,
      this.titleTxt = "",
      this.animationController,
      this.animation, required this.flag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 60 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleTxt,
                    style: AppUtils.textWhitePoppinsSemiBold16,
                  ),
                   InkWell(onTap: () {
                     if(flag=="category"){
                      AppRouter.categoryRoute(controller.allRecipeList);
                     }else if(flag=="recipe"){
                      AppRouter.profileRoute();

                     }
                   },
                     child: Text(
                      "View All",
                      style: AppUtils.textWhitePoppinsLight14,
                                     ),
                   ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
