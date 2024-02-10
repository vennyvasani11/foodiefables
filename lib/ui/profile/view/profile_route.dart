import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/ui/profile/state/profile_controller.dart';
import 'package:get/get.dart';


import '../../../config/App_Theme.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';
import '../../../widget/background_image.dart';
import '../../../widget/recipe_widget.dart';

class ProfileRoute extends GetView<ProfileController> {
  const ProfileRoute({super.key});

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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            "Profile",
                            style: AppUtils.textWhitePoppinsSemiBold16,
                          ),
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Container(
                                  height: 120,
                                  width: AppUtils.width(context),
                                  decoration: BoxDecoration(
                                      color: AppTheme.primary,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       top: 25, right: 25),
                                      //   child: Align(
                                      //     alignment: Alignment.topRight,
                                      //     child: SvgPicture.asset(
                                      //       "${Constants.assetIcon}ic_edit_profile.svg",
                                      //       height: 18,
                                      //       width: 18,
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        controller.name,
                                        style: AppUtils
                                            .textWhitePlayFairSemiBold16,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        controller.email,
                                        style: AppUtils
                                            .textoffGreyPlayFairRegular12,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                                top: 30,
                                right: AppUtils.width(context) / 2 - 40,
                                left: AppUtils.width(context) / 2 - 40,
                                child: Container(
                                  // margin: EdgeInsets.symmetric(horizontal: 60),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      // image: DecorationImage(
                                      //   fit: BoxFit.fill,
                                      //   image: AssetImage(Constants.assetImage +
                                      //       "ic_food.png"),
                                      // ),
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                AppTheme.black.withOpacity(0.5),
                                            offset: Offset(0, 5),
                                            blurRadius: 5)
                                      ],
                                      color: AppTheme.secondary),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: CachedNetworkImage(
                                        // height: 80,
                                        // width: 80,
                                        imageUrl: controller.image ?? '',
                                        fit: BoxFit.contain,
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                ))
                          ],
                        ),
                        // ListTile(
                        //   contentPadding: EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   horizontalTitleGap: 6,
                        //   leading: SvgPicture.asset(
                        //     "${Constants.assetIcon}ic_password.svg",
                        //     height: 20,
                        //     width: 20,
                        //   ),
                        //   title: Text(
                        //     "Reset Password",
                        //     style: AppUtils.textWhitePoppinsRegular16,
                        //   ),
                        // ),
                        // Divider(
                        //     indent: 20,
                        //     endIndent: 20,
                        //     color: AppTheme.grey,
                        //     height: 0),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Powered By",
                              style: AppUtils.textoffGreyPoppinsLight14,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              Constants.assetIcon + "ic_logo.svg",
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Foodie Fables",
                              style: AppUtils.textWhiteRancho20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.logout();
                          },
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "${Constants.assetIcon}ic_logout.svg",
                                  height: 18,
                                  width: 18,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "Log out",
                                  style: AppUtils.textWhiteRancho20,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
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
