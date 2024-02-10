import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiefables/ui/intro/state/intro_controller.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:foodiefables/widget/introwidget.dart';
import 'package:get/get.dart';

import '../../../config/App_Theme.dart';

class OnboardingRoute extends GetView<IntroController> {
  const OnboardingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundImage(),
        Positioned(
          left: 10,
          top: 10,
          right: 10,
          child: SafeArea(
            child: Text(
              textAlign: TextAlign.center,
              "Foodie Fables",
              style: AppUtils.textWhiteRancho32,
            ),
          ),
        ),
        CarouselSlider(
          items: controller.dataList.map((e) {
            return IntroWidget(
                index: e.index,
                image: e.image,
                title: e.title,
                subtitle: e.subTitle1);
          }).toList(),
          carouselController: controller.corosoulcontroller,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              controller.increment(index);
            },
            viewportFraction: 1.0,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Column(
          children: [
            SizedBox(height: AppUtils.height(context) / 1.2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return DotsIndicator(
                      dotsCount: controller.dataList.length,
                      position: controller.selectedIndex,
                      decorator: DotsDecorator(
                        spacing: EdgeInsets.symmetric(horizontal: 3),
                        color: AppTheme.grey.withOpacity(0.3),
                        activeColor: AppTheme.grey,
                        size: const Size.square(6.0),
                        activeSize: const Size(30.0, 6.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    );
                  }),
                  Obx(() {
                    return InkWell(
                      onTap: () {
                        print(controller.selectedIndex);
                        controller.nextPage();
                      },
                      child: Container(alignment: Alignment.center,
                        height: 75,
                        width: 75,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: AppTheme.secondary,
                            shape: BoxShape.circle,
                            // color: AppTheme.white,
                            border:
                                Border.all(color: AppTheme.secondary, width: 5)),
                        child: controller.selectedIndex == controller.dataList.length-1
                            ? Text("Start",style: AppUtils.textWhiteRancho20,)
                            : SvgPicture.asset(
                                "${Constants.assetIcon}ic_next_arrow.svg",
                              ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}
