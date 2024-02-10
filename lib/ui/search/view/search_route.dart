import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:foodiefables/ui/category/view/categore_recipe_list_route.dart';
import 'package:foodiefables/ui/search/state/search_controller.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:get/get.dart';

import '../../../routes/app_router.dart';

class SearchRoute extends GetView<SearchRouteController> {
  const SearchRoute({super.key});

  @override
  Widget build(BuildContext context) {
    controller.animationController!.forward();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {
        return Stack(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: InkWell(
                              onTap: () {
                                AppUtils.goBack(context);
                              },
                              child: Container(
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
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            height: 45,
                            // width: 200,
                            decoration: BoxDecoration(
                                color: AppTheme.searchDarkGrey,
                                borderRadius: BorderRadius.circular(5)),
                            child: TextField(
                              onTapOutside: (event) {
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');
                              },
                              onChanged: (value) {
                                controller.changeValue(value);
                              },
                              style: AppUtils.textWhitePoppinsMedium16,
                              controller: controller.homeController,
                              decoration: InputDecoration(
                                  hintStyle: AppUtils.textWhitePoppinsLight14,
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                  border: InputBorder.none,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.clearData();
                                      },
                                      child: SvgPicture.asset(
                                        Constants.assetIcon +
                                            "ic_white_close.svg",
                                        height: 8,
                                        width: 8,
                                      ),
                                    ),
                                  ),
                                  hintText: "Search for recipes",
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      Constants.assetIcon + "ic_search.svg",
                                      height: 8,
                                      width: 8,
                                    ),
                                  )),
                              textAlignVertical: TextAlignVertical.center,
                            ),
                          ),
                          Flexible(
                            child: Builder(builder: (context) {
                              return Obx(() {
                                return SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: controller.displayRecipeList.isEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Text(
                                                  "Popular",
                                                  style: AppUtils
                                                      .textWhitePoppinsSemiBold16,
                                                ),
                                              ),
                                              GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25,
                                                    vertical: 10),
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .popularCategoryList.length,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisSpacing: 40,
                                                        mainAxisSpacing: 15,
                                                        crossAxisCount: 2),
                                                itemBuilder: (context, index) {
                                                  final item = controller
                                                          .popularCategoryList[
                                                      index];
                                                  return InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CategoryRecipeListRoute(item
                                                                    .title
                                                                    .toString()),
                                                          ));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 120,
                                                      width: 120,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppTheme.primary,
                                                          borderRadius: BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(35),
                                                              topRight: Radius
                                                                  .circular(35),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          35),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      10))),
                                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [ Text(
                                                            "${item.emoji}" ?? '',
                                                            style:TextStyle(fontSize: 28),
                                                          ),
                                                          Text(
                                                            "${item.title}" ?? '',
                                                            style: AppUtils
                                                                .textWhitePoppinsRegular18,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              ListView.builder(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 30),
                                                itemCount: 50,
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      // AppRouter.homeDetailRoute();
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 0,
                                                              vertical: 8),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            height: 90,
                                                            width: 12,
                                                            decoration: BoxDecoration(
                                                                color: AppTheme
                                                                    .secondary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50)),
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Container(
                                                            height: 90,
                                                            // width: 330,
                                                            width: AppUtils.width(
                                                                    context) -
                                                                60,
                                                            decoration: BoxDecoration(
                                                                color: AppTheme
                                                                    .primary,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            25),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            25),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            25))),

                                                            child: Stack(
                                                              children: [
                                                                Positioned(
                                                                  // right: 25,
                                                                  left: 30,
                                                                  top: 13,
                                                                  bottom: 13,
                                                                  child:
                                                                      Container(
                                                                    height: 65,
                                                                    width: 65,
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: AppTheme.black.withOpacity(0.5),
                                                                              blurRadius: 25,
                                                                              spreadRadius: 2)
                                                                        ],
                                                                        color: AppTheme
                                                                            .lightPrimary
                                                                            .withOpacity(
                                                                                0.2),
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(20),
                                                                            topRight: Radius.circular(10),
                                                                            bottomLeft: Radius.circular(20),
                                                                            bottomRight: Radius.circular(10))),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  bottom: 6,
                                                                  left: 6,
                                                                  top: 6,
                                                                  child:
                                                                      Container(
                                                                    height: 80,
                                                                    width: 80,
                                                                    decoration: BoxDecoration(
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: AppTheme.black.withOpacity(0.5),
                                                                              blurRadius: 10,
                                                                              spreadRadius: 2)
                                                                        ],
                                                                        image: DecorationImage(
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          image:
                                                                              AssetImage(Constants.assetImage + "ic_food.png"),
                                                                        ),
                                                                        color: AppTheme.primary,
                                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(10), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(10))),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                    bottom: 16,
                                                                    top: 16,
                                                                    right: 20,
                                                                    left: 110,
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Maxican Burger Maxican BurgerMaxican BurgerMaxican BurgerMaxican Burger",
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              AppUtils.textWhitePoppinsSemiBold16,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                        // SizedBox(
                                                                        //   height: 6,
                                                                        // ),
                                                                        Spacer(),
                                                                        Row(
                                                                          children: [
                                                                            SvgPicture.asset(
                                                                              Constants.assetIcon + "ic_watch.svg",
                                                                              height: 18,
                                                                              width: 18,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 8,
                                                                            ),
                                                                            Text(
                                                                              "30 min",
                                                                              style: AppUtils.textWhitePoppinsSemiBold9,
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 15,
                                                                            ),
                                                                            SvgPicture.asset(
                                                                              Constants.assetIcon + "ic_serving.svg",
                                                                              height: 18,
                                                                              width: 18,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 8,
                                                                            ),
                                                                            Text(
                                                                              "3 people",
                                                                              style: AppUtils.textWhitePoppinsSemiBold9,
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                            Spacer(),
                                                                            SvgPicture.asset(
                                                                              Constants.assetIcon + "ic_save.svg",
                                                                              height: 20,
                                                                              width: 20,
                                                                            ),
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
                                              )
                                            ],
                                          )
                                        : ListView.builder(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 30),
                                            itemCount: controller
                                                .displayRecipeList.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var item = controller
                                                  .displayRecipeList[index];
                                              return InkWell(
                                                onTap: () {
                                                  AppRouter.homeDetailRoute(
                                                      item);
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 8),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: 90,
                                                        width: 12,
                                                        decoration: BoxDecoration(
                                                            color: AppTheme
                                                                .secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Container(
                                                        height: 90,
                                                        // width: 330,
                                                        width: AppUtils.width(
                                                                context) -
                                                            60,
                                                        decoration: BoxDecoration(
                                                            color: AppTheme
                                                                .primary,
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        25),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        25),
                                                                topRight: Radius
                                                                    .circular(
                                                                        25))),

                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              // right: 25,
                                                              left: 30,
                                                              top: 13,
                                                              bottom: 13,
                                                              child: Container(
                                                                height: 65,
                                                                width: 65,
                                                                decoration: BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: AppTheme.black.withOpacity(
                                                                              0.5),
                                                                          blurRadius:
                                                                              25,
                                                                          spreadRadius:
                                                                              2)
                                                                    ],
                                                                    color: AppTheme
                                                                        .lightPrimary
                                                                        .withOpacity(
                                                                            0.2),
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                10),
                                                                        bottomLeft:
                                                                            Radius.circular(
                                                                                20),
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                        boxShadow: [
                                                                      BoxShadow(
                                                                          color: AppTheme.black.withOpacity(
                                                                              0.5),
                                                                          blurRadius:
                                                                              10,
                                                                          spreadRadius:
                                                                              2)
                                                                    ],
                                                                        // image: DecorationImage(
                                                                        //   fit: BoxFit.fill,
                                                                        //   image: AssetImage(Constants.assetImage +
                                                                        //       "ic_food.png"),
                                                                        // ),
                                                                        color: AppTheme
                                                                            .primary,
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(20),
                                                                            topRight: Radius.circular(10),
                                                                            bottomLeft: Radius.circular(20),
                                                                            bottomRight: Radius.circular(10))),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft:
                                                                          Radius.circular(
                                                                              20),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              20),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              10)),
                                                                  child: CachedNetworkImage(
                                                                      height: 80,
                                                                      width: 80,
                                                                      imageUrl: item.image ?? '',
                                                                      fit: BoxFit.contain,
                                                                      imageBuilder: (context, imageProvider) => Container(
                                                                            width:
                                                                                80.0,
                                                                            height:
                                                                                80.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.rectangle,
                                                                              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
                                                                            ),
                                                                          ),
                                                                      errorWidget: (context, url, error) => Text("F")
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
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      item.name
                                                                          .toString(),
                                                                      // "Maxican Burger Maxican BurgerMaxican BurgerMaxican BurgerMaxican Burger",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: AppUtils
                                                                          .textWhitePoppinsSemiBold16,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    // SizedBox(
                                                                    //   height: 6,
                                                                    // ),
                                                                    Spacer(),
                                                                    Row(
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          Constants.assetIcon +
                                                                              "ic_watch.svg",
                                                                          height:
                                                                              18,
                                                                          width:
                                                                              18,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              8,
                                                                        ),
                                                                        (item.totalTime == "null" ||
                                                                                item.totalTime == "0")
                                                                            ? Text(
                                                                                "Under 30 min",
                                                                                style: AppUtils.textWhitePoppinsSemiBold9,
                                                                                textAlign: TextAlign.center,
                                                                              )
                                                                            : Text(
                                                                                "${item.totalTime} min" ?? "",
                                                                                style: AppUtils.textWhitePoppinsSemiBold9,
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                        SizedBox(
                                                                          width:
                                                                              15,
                                                                        ),
                                                                        SvgPicture
                                                                            .asset(
                                                                          Constants.assetIcon +
                                                                              "ic_serving.svg",
                                                                          height:
                                                                              18,
                                                                          width:
                                                                              18,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              8,
                                                                        ),
                                                                        Text(
                                                                          "${item.serving.toString()} people",
                                                                          style:
                                                                              AppUtils.textWhitePoppinsSemiBold9,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                        // Spacer(),
                                                                        // SvgPicture
                                                                        //     .asset(
                                                                        //   Constants.assetIcon +
                                                                        //       "ic_save.svg",
                                                                        //   height:
                                                                        //       20,
                                                                        //   width:
                                                                        //       20,
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
                                          ));
                              });
                            }),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
