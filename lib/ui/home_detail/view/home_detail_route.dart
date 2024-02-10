import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/ui/home_detail/view/open_box.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:get/get.dart';

import '../../../config/App_Theme.dart';
import '../state/home_detail_controller.dart';

class HomeDetailRoute extends GetView<HomeDetailController> {
  const HomeDetailRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SlidingBox(
          physics: NeverScrollableScrollPhysics(),
          draggableIconBackColor: AppTheme.primary,
          draggableIconVisible: false,
          style: BoxStyle.shadow,
          color: AppTheme.primary,

          onBoxSlide: (position) {
            controller.boxOpen(position);
          },

          minHeight: 200,
          maxHeight: 780,
          // color:Colors.transparent,

          body: OpenBoxWidget(
              animation: controller.topBarAnimation,
              animationController: controller.animationController,
              item: controller.item),
          backdrop: Backdrop(
              fading: true,
              overlay: true,
              overlayOpacity: 0.2,
              backgroundGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.primary,
                    AppTheme.backgroundimage1.withOpacity(0.65),
                    AppTheme.backgroundimage2.withOpacity(0.65),
                    AppTheme.backgroundimage3.withOpacity(0.65),
                    AppTheme.primary,
                    AppTheme.backgroundimage4.withAlpha(245),
                    AppTheme.black.withAlpha(255),

                    // AppTheme.primary
                  ]),
              moving: true,
              appBar: BackdropAppBar(
                title: Visibility(
                  visible: controller.openBox,
                  child: Container(
                    width: AppUtils.width(context) - 25,
                    margin: const EdgeInsets.only(top: 3, left: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Constants.assetIcon + "ic_logo.svg",
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Foodie Fables",
                            style: AppUtils.textWhiteRancho32),
                      ],
                    ),
                  ),
                ),
              ),
              body: Stack(
                children: [
                  // BackgroundImage2(),
                  // Positioned(
                  //   right: 0,
                  //   top: -40,
                  //   child: Container(
                  //     height: 200, width: 200,
                  //     // height: AppUtils.height(context),
                  //     child: Image.asset(
                  //       Constants.assetImage + "ic_detail_dish.png",
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          height: 150, width: AppUtils.width(context),
                          // height: AppUtils.height(context),
                          child: Image.asset(
                            Constants.assetImage + "ic_detail_dish.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        // SizedBox(
                        //   height: 210,
                        // ),
                        SizedBox(
                          height: 325,
                          width: AppUtils.width(context),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 45, right: 65),
                                height: 300,
                                // width: 250,
                                decoration: BoxDecoration(
                                  color: AppTheme.primary,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    right: 45, left: 65, top: 20),
                                height: 300,
                                // width: 300,
                                decoration: BoxDecoration(
                                    
                                    color: AppTheme.secondary,
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppTheme.black.withOpacity(0.25),
                                          spreadRadius: 15,
                                          blurRadius: 15)
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                      // height: 80,
                                      // width: 80,
                                      imageUrl: controller.item.image ?? '',
                                      fit: BoxFit.contain,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                            // width: 80.0,
                                            // height: 80.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Text("F")
                                      // Image.asset(
                                      //     '${Constants.assetImage}ic_no_image.png')

                                      ),
                                ),
                              ),
                              // Positioned(
                              //     right: 60,
                              //     bottom: 20,
                              //     child: SvgPicture.asset(
                              //       Constants.assetIcon + "ic_save.svg",
                              //       height: 20,
                              //       width: 20,
                              //     ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Constants.assetIcon + "ic_white_watch.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                 (controller.item.totalTime == "null" ||
                                                  controller.item.totalTime == "0")
                                              ? Text(
                                                  "Under 30 min",
                                                  style: AppUtils
                                                      .textWhitePoppinsSemiBold9,
                                                  textAlign: TextAlign.center,
                                                )
                                              : Text(
                                                  "${controller.item.totalTime} min" ?? "",
                                                  style: AppUtils
                                                      .textWhitePoppinsSemiBold9,
                                                  textAlign: TextAlign.center,
                                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Constants.assetIcon + "ic_white_serving.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${controller.item.serving.toString()} Serving",
                                  style: AppUtils.textWhitePoppinsMedium12,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                SvgPicture.asset(
                                  Constants.assetIcon + "ic_white_healthy.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Healthy",
                                  style: AppUtils.textWhitePoppinsMedium12,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Container(
                            // height: 60,
                            width: AppUtils.width(context) - 40,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppTheme.black.withOpacity(0.30),
                                      offset: Offset(0, 2),
                                      spreadRadius: 4,
                                      blurRadius: 6)
                                ],
                                color: AppTheme.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.ingredientvisible();
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Constants.assetIcon +
                                            "ic_white_indigredients.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        "Ingredients",
                                        style:
                                            AppUtils.textWhitePoppinsMedium16,
                                      ),
                                      Spacer(),
                                      !controller.ingredientsVisible
                                          ? SvgPicture.asset(
                                              Constants.assetIcon +
                                                  "ic_white_down_arrow.svg",
                                              height: 8,
                                              width: 8,
                                            )
                                          : SvgPicture.asset(
                                              Constants.assetIcon +
                                                  "ic_white_up_arrow.svg",
                                              height: 8,
                                              width: 8,
                                            ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: false,
                                  // controller.ingredientsVisible,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 40, top: 20),
                                      height: 40,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: AppTheme.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(onTap: () {
                                            controller.decrement();
                                          },
                                            child: SvgPicture.asset(
                                              Constants.assetIcon + "ic_sub.svg",
                                              height: 20,
                                              width: 20,
                                            ),
                                          ),
                                          Text(
                                            controller.quantityIncrement.toString(),
                                            style: AppUtils
                                                .textBlackPoppinsMedium20,
                                          ),
                                          InkWell(onTap: () {
                                            controller.increment();
                                          },
                                            child: SvgPicture.asset(
                                              Constants.assetIcon + "ic_plus.svg",
                                              height: 20,
                                              width: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller.ingredientsVisible,
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(left: 40, top: 15),
                                    itemCount:
                                        controller.item.ingredients!.length,
                                    itemBuilder: (context, index) {
                                      var item =
                                          controller.item.ingredients![index];
                                      return Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              item.ingredientName.toString(),
                                              style: AppUtils
                                                  .textWhitePoppinsMedium12,
                                              maxLines: 3,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "${item.unit1!.quantity.toString()} ${item.unit1!.unit.toString()} ",
                                            style: AppUtils
                                                .textWhitePoppinsMedium12,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        indent: 10,
                                        endIndent: 10,
                                        color: AppTheme.grey,
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Container(
                            // height: 60,
                            width: AppUtils.width(context) - 40,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppTheme.black.withOpacity(0.30),
                                      offset: Offset(0, 2),
                                      spreadRadius: 4,
                                      blurRadius: 6)
                                ],
                                color: AppTheme.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.nutritionvisible();
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Constants.assetIcon +
                                            "ic_white_nutrition.svg",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text(
                                        "Nutrition",
                                        style:
                                            AppUtils.textWhitePoppinsMedium16,
                                      ),
                                      Spacer(),
                                      !controller.nutritionVisible
                                          ? SvgPicture.asset(
                                              Constants.assetIcon +
                                                  "ic_white_down_arrow.svg",
                                              height: 8,
                                              width: 8,
                                            )
                                          : SvgPicture.asset(
                                              Constants.assetIcon +
                                                  "ic_white_up_arrow.svg",
                                              height: 8,
                                              width: 8,
                                            ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: controller.nutritionVisible,
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisSpacing: 5.0,
                                            mainAxisSpacing: 10.0,
                                            crossAxisCount: 3),
                                    itemCount: controller.nutritionDisplayList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    // padding: EdgeInsets.only(left: 40, top: 15),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppTheme.black
                                                          .withOpacity(0.25),
                                                      spreadRadius: 3,
                                                      offset: Offset(0, 6),
                                                      blurRadius: 5)
                                                ],
                                                color: AppTheme.secondary,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  Constants.assetIcon +
                                                      "ic_white_energy.svg",
                                                  height: 25,
                                                  width: 25,
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  controller
                                                      .nutritionList[index],
                                                  style: AppUtils
                                                      .textWhitePoppinsMedium10,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "${controller.nutritionDisplayList[index].gram} Gram",
                                            style: AppUtils
                                                .textWhitePoppinsMedium10,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
      }),
    );
  }
}
