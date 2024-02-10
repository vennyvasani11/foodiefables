import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../utils/app_utils.dart';


import '../state/home_controller.dart';

class HomeRoute extends GetView<HomeController> {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (context) {
            return Stack(children: [
              BackgroundImage(),
            
              getMainListViewUI(),
              getAppBarUI(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              ),
            ]);
          }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        //Init Floating Action Bubble
        floatingActionButton: Obx(() {
          return FloatingActionBubble(
            // Menu items
            items: <Bubble>[
              // Bubble(
              //   title: "Saved Recipe",
              //   iconColor: Colors.white,
              //   bubbleColor: AppTheme.secondary,
              //   icon: SvgPicture.asset(
              //     Constants.assetIcon + "ic_like_save.svg",
              //     height: 20,
              //     width: 20,
              //   ),
              //   titleStyle: AppUtils.textWhitePoppinsMedium18,
              //   onPress: () {
              //     controller.flotingActionController!.reverse();
              //     AppRouter.savedRecipeRoute();
              //     controller.chaged();

              //     controller.animationController!.forward();
              //   },
              // ),
              Bubble(
                title: "Category",
                iconColor: Colors.white,
                bubbleColor: AppTheme.secondary,
                icon: SvgPicture.asset(
                  Constants.assetIcon + "ic_category.svg",
                  height: 20,
                  width: 20,
                ),
                titleStyle: AppUtils.textWhitePoppinsMedium18,
                onPress: () {
                  controller.flotingActionController!.reverse();
                  AppRouter.categoryRoute(controller.allRecipeList);
                  controller.chaged();

                  controller.animationController!.forward();
                },
              ),
              Bubble(
                title: "Profile",
                iconColor: Colors.white,
                bubbleColor: AppTheme.secondary,
                icon: SvgPicture.asset(
                  Constants.assetIcon + "ic_profile.svg",
                  height: 25,
                  width: 25,
                ),
                titleStyle: AppUtils.textWhitePoppinsMedium18,
                onPress: () {
                  controller.flotingActionController!.reverse();
                  AppRouter.profileRoute();
                  controller.chaged();

                  controller.animationController!.forward();
                },
              ),
            ],

            // animation controller
            animation: controller.flotingActionAnimation!,
            // On pressed change animation state
            onPress: () {
              if (controller.flotingActionController!.isCompleted) {
                controller.chaged();
                controller.flotingActionController!.reverse();
                controller.animationController!.forward();
              } else {
                controller.chaged();

                controller.animationController!.reverse();

                controller.flotingActionController!.forward();
              }
              ;
            },

            // Floating Action button Icon color
            iconColor: Colors.blue,
            elevation: 20,

            // Floating Action button Icon
            iconData: controller.visible
                ? SvgPicture.asset(
                    "${Constants.assetIcon}ic_close.svg",
                    height: 20,
                    width: 20,
                  )
                : SvgPicture.asset(
                    "${Constants.assetIcon}ic_profile.svg",
                    height: 25,
                    width: 25,
                  ),

            backGroundColor: AppTheme.secondary,
          );
        }),
      ),
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: controller.animationController!,
          builder: (BuildContext context, Widget? child) {
            return Obx(() {
              return FadeTransition(
                opacity: controller.animationController!,
                child: Transform(
                  transform: Matrix4.translationValues(0.0,
                      60 * (1.0 - controller.animationController!.value), 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primary
                          .withOpacity(controller.topBarOpacity),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: AppTheme.black
                                .withOpacity(0.4 * controller.topBarOpacity),
                            offset: const Offset(1.1, 1.1),
                            spreadRadius: 5,
                            blurRadius: 5.0),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).padding.top,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 10 - 8.0 * controller.topBarOpacity,
                              bottom: 10 - 8.0 * controller.topBarOpacity),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 25 + 6 - 6 * controller.topBarOpacity,
                                  backgroundImage: AssetImage(
                                      Constants.assetImage + "ic_food.png"),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  AppRouter.search(controller.allRecipeList);
                                },
                                child: SvgPicture.asset(
                                  Constants.assetIcon + "ic_search.svg",
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     AppRouter.notificationRoute();
                              //   },
                              //   child: SvgPicture.asset(
                              //     Constants.assetIcon + "ic_notification.svg",
                              //     height: 30,
                              //     width: 30,
                              //   ),
                              // ),
                              SizedBox(
                                width: 15 + 4 - 6 * controller.topBarOpacity,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
          },
        )
      ],
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: controller.getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return Obx(
             () {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: controller.scrollController,
                padding: EdgeInsets.only(
                  top: AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top +
                      24,
                  bottom: 62 + MediaQuery.of(context).padding.bottom,
                ),
                itemCount: controller.listViews.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  controller.animationController!.forward();
                  return controller.listViews[index];
                },
              );
            }
          );
        }
      },
    );
  }
}
