import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/App_Theme.dart';
import '../utils/Constant.dart';
import '../utils/app_utils.dart';
import 'background_image.dart';

class IntroWidget extends StatelessWidget {
  final int index;
  final String image;
  final String title;
  final String subtitle;

  const IntroWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppUtils.width(context),
      child: Stack(
        children: [
          Positioned(
            right: 4 == index ? 20 : 10,
            top: 4 == index ? 110 : 70,
            child: SafeArea(
              child: SvgPicture.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: 4 == index
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  4 == index
                      ? SizedBox(height: AppUtils.height(context) / 1.6)
                      : SizedBox(height: AppUtils.height(context) / 1.8),
                  Text(
                    title,
                    style: AppUtils.textWhitePlayFairSemiBold32,
                  ),
                  SizedBox(height: 14),
                  Text(
                    subtitle,
                    textAlign: 4 == index ? TextAlign.center : TextAlign.start,
                    style: AppUtils.textWhitePoppinsRegular16,
                  ),
                  // SizedBox(height: 50),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       DotsIndicator(
                  //         dotsCount: 4,
                  //         position: 1,

                  //         //  double.parse(
                  //         //     controller.pageIndex.toString()),
                  //         decorator: DotsDecorator(
                  //           spacing: EdgeInsets.symmetric(horizontal: 3),
                  //           color: AppTheme.grey.withOpacity(0.3),
                  //           activeColor: AppTheme.grey,
                  //           size: const Size.square(6.0),
                  //           activeSize: const Size(30.0, 6.0),
                  //           activeShape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(5.0)),
                  //         ),
                  //       ),
                  //       InkWell(
                  //         onTap: () {
                  //           controller.nextPage();
                  //         },
                  //         child: Container(
                  //           height: 75,
                  //           width: 75,
                  //           padding: EdgeInsets.all(10),
                  //           decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //               // color: AppTheme.white,
                  //               border: Border.all(
                  //                   color: AppTheme.white, width: 5)),
                  //           child: SvgPicture.asset(
                  //             "${Constants.assetIcon}ic_next_arrow.svg",
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
