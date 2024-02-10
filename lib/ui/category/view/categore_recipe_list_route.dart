import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/ui/category/state/category_controller.dart';
import 'package:get/get.dart';


import '../../../config/App_Theme.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';
import '../../../widget/background_image.dart';

class CategoryRecipeListRoute extends GetView<CategoryController> {
  final String category;
  const CategoryRecipeListRoute(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    controller.animationController!.forward();

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          SafeArea(
              child: AnimatedBuilder(
            animation: controller.animationController1!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: controller.animationController1!,
                child: Transform(
                  transform: Matrix4.translationValues(0.0,
                      60 * (1.0 - controller.animationController1!.value), 0.0),
                  child: Column(
                    children: [      AppBar(
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
                          category,
                            style: AppUtils.textWhitePoppinsSemiBold16,
                          ),
                        ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.categoryRecipeList.length,
                          // widget.recipeList.length,
                          itemBuilder: (BuildContext context, int index) {
                            //  final int count =
                            //       // widget.categoryList!.length > 10
                            //       (10 == 8) ? 10 : 3;
                            final int count =
                                controller.categoryRecipeList.length > 10
                                    ? 10
                                    : controller.categoryRecipeList.length;
                            final Animation<double> animation =
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: controller.animationController1!,
                                        curve: Interval((1 / count) * index, 1.0,
                                            curve: Curves.fastOutSlowIn)));
                            controller.animationController1?.forward();
                      
                          
                            final item = controller.categoryRecipeList[index];
                            return InkWell(
                              onTap: () {
                                AppRouter.homeDetailRoute(item);
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 12,
                                      decoration: BoxDecoration(
                                          color: AppTheme.secondary,
                                          borderRadius: BorderRadius.circular(50)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 90,
                                      // width: 330,
                                      width: AppUtils.width(context) - 60,
                                      decoration: BoxDecoration(
                                          color: AppTheme.primary,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(10),
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25))),
                      
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // right: 25,
                                            left: 30,
                                            top: 13, bottom: 13,
                                            child: Container(
                                              height: 65,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: AppTheme.black
                                                            .withOpacity(0.5),
                                                        blurRadius: 25,
                                                        spreadRadius: 2)
                                                  ],
                                                  color: AppTheme.lightPrimary
                                                      .withOpacity(0.2),
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(10),
                                                      bottomLeft: Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(10))),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 6,
                                            left: 6,
                                            top: 6,
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: AppTheme.black
                                                            .withOpacity(0.5),
                                                        blurRadius: 10,
                                                        spreadRadius: 2)
                                                  ],
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        Constants.assetImage +
                                                            "ic_launcher.png"),
                                                  ),
                                                  color: AppTheme.primary,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(10),
                                                      bottomLeft: Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(10))),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(20),
                                                    topRight: Radius.circular(10),
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(10)),
                                                child: CachedNetworkImage(
                                                    height: 80,
                                                    width: 80,
                                                    imageUrl: item.image ?? '',
                                                    fit: BoxFit.contain,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.rectangle,
                                                            image: DecorationImage(
                                                                image: imageProvider,
                                                                fit: BoxFit.fill),
                                                          ),
                                                        ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Text("F")
                                                    // Image.asset(
                                                    //     '${Constants.assetImage}ic_no_image.png')
                      
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 16,
                                              top: 16,
                                              right: 20,
                                              left: 110,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.name.toString(),
                                                    // "Maxican Burger Maxican BurgerMaxican BurgerMaxican BurgerMaxican Burger",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppUtils
                                                        .textWhitePoppinsSemiBold16,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  // SizedBox(
                                                  //   height: 6,
                                                  // ),
                                                  Spacer(),
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                    Expanded(
                                                      child: Row(children: [  SvgPicture.asset(
                                                          Constants.assetIcon +
                                                              "ic_watch.svg",
                                                          height: 18,
                                                          width: 18,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        (item.totalTime == "null" ||
                                                                item.totalTime == "0")
                                                            ? Text(
                                                                "Under 30 min",
                                                                style: AppUtils
                                                                    .textWhitePoppinsSemiBold9,
                                                                textAlign:
                                                                    TextAlign.center,
                                                              )
                                                            : Text(
                                                                "${item.totalTime} min" ??
                                                                    "",
                                                                style: AppUtils
                                                                    .textWhitePoppinsSemiBold9,
                                                                textAlign:
                                                                    TextAlign.center,
                                                              ),],),
                                                    ),
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                     Expanded(
                                                       child: Row(children: [ SvgPicture.asset(
                                                          Constants.assetIcon +
                                                              "ic_serving.svg",
                                                          height: 18,
                                                          width: 18,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          "${item.serving.toString()} people",
                                                          style: AppUtils
                                                              .textWhitePoppinsSemiBold9,
                                                          textAlign: TextAlign.center,
                                                        ),],),
                                                     )
                                                      // SvgPicture.asset(
                                                      //   Constants.assetIcon + "ic_save.svg",
                                                      //   height: 20,
                                                      //   width: 20,
                                                      // ),
                                                    ],
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
