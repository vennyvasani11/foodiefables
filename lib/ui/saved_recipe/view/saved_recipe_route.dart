import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:foodiefables/ui/saved_recipe/state/saved_recipe_conrtoller.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:foodiefables/widget/recipe_widget.dart';
import 'package:get/get.dart';


class SavedRecipeRoute extends GetView<SavedRecipeController> {
  const SavedRecipeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    controller.animationController!.forward();

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          SafeArea(
            child: AnimatedBuilder(
              animation: controller.animationController!,
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                  opacity: controller.topBarAnimation!,
                  child: Transform(
                    transform: Matrix4.translationValues(0.0,
                        100 * (1.0 - controller.topBarAnimation!.value), 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBar(
                          leadingWidth: 80,
                          backgroundColor: Colors.transparent,
                          centerTitle: true,
                          flexibleSpace: InkWell(
                            onTap: () {
                              AppUtils.goBack(context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.only(right: 3),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppTheme.black,
                                        blurRadius: 3,
                                        spreadRadius: 5)
                                  ],
                                  color: AppTheme.secondary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: SvgPicture.asset(
                                "${Constants.assetIcon}ic_back_arrow.svg",
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ),
                          leading: SizedBox(),
                          title: Text(
                            "Saved Recipe",
                            style: AppUtils.textWhitePoppinsSemiBold16,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return RecipeWidget();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
