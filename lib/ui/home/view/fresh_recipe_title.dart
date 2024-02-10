import 'package:flutter/material.dart';

import '../../../utils/app_utils.dart';

class FreshRecipetitle extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const FreshRecipetitle(
      {Key? key,
      this.titleTxt = "",
      this.subTxt = "",
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 60 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Fresh Recipes",
                    style: AppUtils.textWhitePoppinsSemiBold16,
                  ),
                 
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
