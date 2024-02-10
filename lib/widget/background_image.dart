import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/config/App_Theme.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../utils/Constant.dart';
import '../utils/app_utils.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppUtils.height(context),
          width: AppUtils.width(context),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                AppTheme.backgroudcolor1,
                AppTheme.backgroudcolor2,
                AppTheme.backgroudcolor3,
                AppTheme.backgroudcolor3,
                AppTheme.backgroudcolor3,
                AppTheme.backgroudcolor2,
                AppTheme.backgroudcolor1
              ])),
        ),  Center(
            child: Opacity(opacity: 0.2,
              child: SvgPicture.asset(
                Constants.assetIcon + "ic_logo.svg",
                height: 300,
                width: 300,
              ),
            ),
          ),
       
      ],
    );
  
  }
}

