import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../config/App_Theme.dart';
import '../utils/Constant.dart';
import '../utils/app_utils.dart';

class BackgroundImage2 extends StatelessWidget {
  const BackgroundImage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppUtils.height(context),
          width: AppUtils.width(context),
          decoration: BoxDecoration(
              gradient: LinearGradient(
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
              ])),
        ),
        // GlassmorphicContainer(
        //   height: AppUtils.height(context),
        //   width: AppUtils.width(context),
        //   borderRadius: 20,
        //   blur: 1000,
        //   alignment: Alignment.bottomCenter,
        //   border: 2,
        //   linearGradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [
        //         Colors.transparent.withOpacity(0.1),
        //         Colors.transparent.withOpacity(0.05),
        //       ],
        //       stops: [
        //         0.1,
        //         1,
        //       ]),
        //   borderGradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Colors.transparent.withOpacity(0.5),
        //       Colors.transparent.withOpacity(0.5),
        //     ],
        //   ),
        //   child: null,
        // ),
      ],
    );
    // GlassmorphicContainer(
    //     height: AppUtils.height(context),
    //     width: AppUtils.width(context),
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             begin: Alignment.topLeft,
    //             end: Alignment.bottomRight,
    //             colors: [
    //           Color(0xff200505),
    //           Color(0xff0C0202),
    //           Color(0xff0C0202),
    //           Color(0xff0C0202),
    //           Color(0xff200505)
    //         ])),
    // child: SvgPicture.asset(
    //   "${Constants.assetImage}ic_splash_screen.svg",
    //   fit: BoxFit.fill,
    // )
    // );
  }
}
