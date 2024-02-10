import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/ui/category/state/category_controller.dart';
import 'package:foodiefables/ui/category/view/categore_recipe_list_route.dart';
import 'package:get/get.dart';


import '../../../config/App_Theme.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';
import '../../../widget/background_image.dart';

class CategoryRoute extends GetView<CategoryController> {
  const CategoryRoute({super.key});

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
                            hoverColor: AppTheme.black,
                            focusColor: AppTheme.black,
                            highlightColor: AppTheme.black,
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
                            "Categories",
                            style: AppUtils.textWhitePoppinsSemiBold16,
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    crossAxisCount: 2),
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            itemCount: controller.allCategoryList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var item = controller.allCategoryList[index];
                              return InkWell(
                                onTap: () {

                                  controller.categoryFindData(item.title.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryRecipeListRoute(
                                              
                                                item.title.toString()),
                                      ));
                                },
                                child: SizedBox(
                                  // height: 80,
                                  // width: 80,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        radius: 5,
                                        backgroundColor: AppTheme.primary,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 180,
                                        width: AppUtils.width(context) / 2 - 50,
                                        decoration: BoxDecoration(
                                            color: AppTheme.primary,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(40),
                                                topLeft: Radius.circular(40),
                                                topRight: Radius.circular(40))),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              right: 16,
                                              left: 16,
                                              top: 20,
                                              child: Container(
                                                height: 113,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: AppTheme.black
                                                              .withOpacity(0.5),
                                                          blurRadius: 25,
                                                          spreadRadius: 2)
                                                    ],
                                                    color: AppTheme.lightPrimary
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10))),
                                              ),
                                            ),
                                            Positioned(
                                              right: 10,
                                              left: 10,
                                              top: 10,
                                              child: Container(
                                                height: 113,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: AppTheme.black
                                                              .withOpacity(0.5),
                                                          blurRadius: 5,
                                                          spreadRadius: 2)
                                                    ],
                                                    color: AppTheme.primary,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    35),
                                                            topRight:
                                                                Radius.circular(
                                                                    35),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10))),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(35),
                                                          topRight:
                                                              Radius.circular(
                                                                  35),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                  child: CachedNetworkImage(
                                                      memCacheHeight: 100,
                                                      memCacheWidth: 100,
                                                      height: 80,
                                                      width: 80,
                                                      imageUrl:
                                                          item.image ?? '',
                                                      fit: BoxFit.contain,
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                            width: 80.0,
                                                            height: 80.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              image: DecorationImage(
                                                                  image:
                                                                      imageProvider,
                                                                  fit: BoxFit
                                                                      .fill),
                                                            ),
                                                          ),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Text("F")
                                                      // Image.asset(
                                                      //     '${Constants.assetImage}ic_no_image.png')

                                                      ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 10,
                                                right: 6,
                                                left: 6,
                                                child: Text(
                                                  item.title.toString(),
                                                  style: AppUtils
                                                      .textWhitePoppinsSemiBold12,
                                                  textAlign: TextAlign.center,
                                                ))
                                          ],
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
