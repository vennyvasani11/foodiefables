import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../config/App_Theme.dart';
import '../../../routes/app_router.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';

class CookingRoute extends StatefulWidget {
  const CookingRoute({super.key});

  @override
  State<CookingRoute> createState() => _CookingRouteState();
}

class _CookingRouteState extends State<CookingRoute>
    with TickerProviderStateMixin {
  bool icon1 = false;
  bool icon2 = false;

  bool icon3 = false;
  int percent = 0;
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Interval((1 / 10) * 1, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    animationController?.forward();
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Column(
            children: [
              AnimatedBuilder(
                animation: animationController!,
                builder: (BuildContext context, Widget? child) {
                  return FadeTransition(
                    opacity: animation!,
                    child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, 50 * (1.0 - animation!.value), 0.0),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.asset(
                          Constants.assetImage + "ic_image_3.png",
                          // height: 200,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      AppRouter.foodCategory();
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
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  "How would you describe your cooking skills?",
                  style: AppUtils.textWhitePoppinsMedium16,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: StepProgressIndicator(
                  totalSteps: 2,
                  currentStep: percent,
                  size: 8,
                  selectedColor: AppTheme.white,
                  unselectedColor: AppTheme.darkGrey,
                  roundedEdges: Radius.circular(10),
                ),

                //  LinearPercentIndicator(
                //   lineHeight: 9,
                //   animation: true,
                //   progressColor: AppTheme.white,
                //   backgroundColor: AppTheme.darkGrey,
                //   barRadius: Radius.circular(10),
                //   percent: percent,
                // )
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedBuilder(
                animation: animationController!,
                builder: (BuildContext context, Widget? child) {
                  return FadeTransition(
                    opacity: animation!,
                    child: Transform(
                        transform: Matrix4.translationValues(
                            0.0, 60 * (1.0 - animation!.value), 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (icon1 == false && percent == 0) {
                                    percent = 1;
                                    icon1 = true;
                                  } else if (icon1 == false && percent == 1) {
                                    percent = 2;
                                    icon1 = true;
                                  } else if (icon1 == true && percent == 1) {
                                    percent = 0;
                                    icon1 = false;
                                  } else if (icon1 == true && percent == 2) {
                                    percent = 1;
                                    icon1 = false;
                                  } else if (icon1 == false && percent == 2) {
                                    icon1 = false;
                                  }
                                });
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(20, 50)),
                                    border: Border.all(
                                        width: 6,
                                        color: icon1
                                            ? AppTheme.white
                                            : AppTheme.darkGrey)),
                                child: SvgPicture.asset(
                                  Constants.assetIcon + "ic_knife.svg",
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (icon2 == false && percent == 0) {
                                    percent = 1;
                                    icon2 = true;
                                  } else if (icon2 == false && percent == 1) {
                                    percent = 2;
                                    icon2 = true;
                                  } else if (icon2 == true && percent == 1) {
                                    percent = 0;
                                    icon2 = false;
                                  } else if (icon2 == true && percent == 2) {
                                    percent = 1;
                                    icon2 = false;
                                  } else if (icon2 == false && percent == 2) {
                                    icon2 = false;
                                  }
                                  // if(percent==1&&icon2==true) {
                                  //   percent = 2;
                                  // }else if (icon2==false){
                                  //   percent=0;
                                  // }
                                });
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(20, 50)),
                                    border: Border.all(
                                        width: 6,
                                        color: icon2
                                            ? AppTheme.white
                                            : AppTheme.darkGrey)),
                                child: SvgPicture.asset(
                                  Constants.assetIcon + "ic_spoon.svg",
                                  height: 45,
                                  width: 45,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // icon3 = !icon3;
                                  if (icon3 == false && percent == 0) {
                                    percent = 1;
                                    icon3 = true;
                                  } else if (icon3 == false && percent == 1) {
                                    percent = 2;
                                    icon3 = true;
                                  } else if (icon3 == true && percent == 1) {
                                    percent = 0;
                                    icon3 = false;
                                  } else if (icon3 == true && percent == 2) {
                                    percent = 1;
                                    icon3 = false;
                                  } else if (icon3 == false && percent == 2) {
                                    icon3 = false;
                                  }
                                  // if (percent == 0 && icon3 == true) {
                                  //   percent = 1;
                                  // } else if (percent == 1 && icon3 == true) {
                                  //   percent = 2;
                                  // } else {}
                                  // } else {
                                  //   if (percent == 2 && icon3 == false) {
                                  //     percent = 1;
                                  //   } else if (percent == 1 && icon3 == false) {
                                  //     percent = 0;
                                  //   }
                                  // }
                                });
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(20, 50)),
                                    border: Border.all(
                                        width: 6,
                                        color: icon3
                                            ? AppTheme.white
                                            : AppTheme.darkGrey)),
                                child: SvgPicture.asset(
                                  Constants.assetIcon + "ic_timer.svg",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
