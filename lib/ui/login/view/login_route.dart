import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/ui/login/state/login_controller.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../home/state/home_controller.dart';

class LoginRoute extends GetView<LoginController> {
  const LoginRoute({super.key});

  @override
  Widget build(BuildContext context) {
    controller.animationController?.forward();

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundImage(),
          AnimatedBuilder(
            animation: controller.animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: controller.topBarAnimation!,
                child: Transform(
                    transform: new Matrix4.translationValues(0.0,
                        60 * (1.0 - controller.topBarAnimation!.value), 0.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              Constants.assetImage + "ic_image_1.png",
                              height: 180,
                              width: 200,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                AppRouter.cooking();
                              },
                              child: Container(
                                height: 35,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: AppTheme.secondary,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppTheme.black,
                                          blurRadius: 15,
                                          spreadRadius: 5)
                                    ]),
                                child: Center(
                                    child: Text(
                                  "Skip",
                                  style: AppUtils.textWhitePoppinsRegular16,
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppTheme.secondary.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    Constants.assetIcon + "ic_email.svg",
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: "Enter Email",
                                hintStyle: AppUtils.textWhitePoppinsRegular16),
                            cursorColor: AppTheme.white,
                            style: AppUtils.textWhitePoppinsRegular16,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppTheme.secondary.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: SvgPicture.asset(
                                    Constants.assetIcon + "ic_password.svg",
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                                border: InputBorder.none,
                                hintText: "Enter Password",
                                hintStyle: AppUtils.textWhitePoppinsRegular16),
                            style: AppUtils.textWhitePoppinsRegular16,
                            cursorColor: AppTheme.white,
                          ),
                        ),
                        Obx(() {
                          return InkWell(
                            onTap: () async {
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              if (controller.emailController.text.isEmpty) {
                                return AppUtils.toastMessage(
                                    "Please Enter Email Address");
                              }

                              if (controller.passwordController.text.isEmpty) {
                                return AppUtils.toastMessage(
                                    "Please Enter Password");
                              }

                              if (controller.emailController.text.isNotEmpty &&
                                  controller
                                      .passwordController.text.isNotEmpty) {
                                controller.login();
                              }
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 20),
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                              ),
                              decoration: BoxDecoration(
                                  color: AppTheme.secondary,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppTheme.black,
                                        blurRadius: 15,
                                        spreadRadius: 5)
                                  ]),
                              child: Center(
                                  child: controller.status.isLoading
                                      ? CircularProgressIndicator(
                                          color: AppTheme.white,
                                        )
                                      : Text(
                                          "Submit",
                                          style: AppUtils
                                              .textWhitePoppinsRegular16,
                                          textAlign: TextAlign.center,
                                        )),
                            ),
                          );
                        }),
                        Divider(
                          indent: 20,
                          endIndent: 20,
                          color: AppTheme.lightGrey,
                        ),
                        InkWell(
                          onTap: () {
                            controller.loginGoogle();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppTheme.primary.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Constants.assetIcon + "ic_google.svg",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Connect With Google",
                                  style: AppUtils.textWhitePoppinsRegular16,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                          ),
                        ),
                        // Spacer(),

                        SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          Constants.assetImage + "ic_image_2.png",
                          height: 200,
                          width: AppUtils.width(context),
                          fit: BoxFit.fill,
                        ),
                      ],
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
