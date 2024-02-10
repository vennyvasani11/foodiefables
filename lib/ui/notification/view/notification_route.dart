import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:get/get.dart';

import '../state/notification_controller.dart';

class NotificationRoute extends GetView<NotificationController> {
  const NotificationRoute({super.key});

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
                          flexibleSpace: Container(
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
                            child: InkWell(
                              onTap: () {
                                AppUtils.goBack(context);
                              },
                              child: SvgPicture.asset(
                                "${Constants.assetIcon}ic_back_arrow.svg",
                                height: 18,
                                width: 18,
                              ),
                            ),
                          ),
                          leading: SizedBox(),
                          title: Text(
                            "Notifications",
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
                              return InkWell(
                                onTap: () {
                                  // AppRouter.homeDetailRoute();
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 12,
                                        decoration: BoxDecoration(
                                            color: AppTheme.secondary,
                                            borderRadius:
                                                BorderRadius.circular(50)),
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
                                                bottomRight:
                                                    Radius.circular(10),
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
                                                    borderRadius:
                                                        BorderRadius.only(
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
                                                                    10))),
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
                                                              "ic_food.png"),
                                                    ),
                                                    color: AppTheme.primary,
                                                    borderRadius:
                                                        BorderRadius.only(
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
                                                                    10))),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 8,
                                                top: 8,
                                                right: 20,
                                                left: 110,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Maxican Burger Maxican BurgerMaxican BurgerMaxican BurgerMaxican Burger",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppUtils
                                                          .textWhitePoppinsSemiBold16,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    // Spacer(),
                                                    Text(
                                                      "Fresh salad with chicken breast Fresh salad with chicken breastFresh salad with chicken...... Fresh salad with chicken breast Fresh salad.",
                                                      style: AppUtils
                                                          .textmediumGreyPoppinsLight8,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                )),
                                            Positioned(
                                                bottom: 8,
                                                // top: 8,
                                                right: 20,
                                                // left: 110,
                                                child: Text(
                                                  "12:51 PM",
                                                  style: AppUtils
                                                      .textWhitePoppinsLight9,
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
