import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/App_Theme.dart';
import '../routes/app_router.dart';
import '../utils/Constant.dart';
import '../utils/app_utils.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // AppRouter.homeDetailRoute();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 12,
              decoration: BoxDecoration(
                  color: AppTheme.secondary,
                  borderRadius: BorderRadius.circular(50)),
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
                      bottomRight: Radius.circular(10),
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
                                color: AppTheme.black.withOpacity(0.5),
                                blurRadius: 25,
                                spreadRadius: 2)
                          ],
                          color: AppTheme.lightPrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(10))),
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
                                color: AppTheme.black.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 2)
                          ],
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                Constants.assetImage + "ic_food.png"),
                          ),
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(10))),
                    ),
                  ),
                  Positioned(
                      bottom: 16,
                      top: 16,
                      right: 20,
                      left: 110,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Maxican Burger Maxican BurgerMaxican BurgerMaxican BurgerMaxican Burger",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppUtils.textWhitePoppinsSemiBold16,
                            textAlign: TextAlign.center,
                          ),
                          // SizedBox(
                          //   height: 6,
                          // ),
                          Spacer(),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Constants.assetIcon + "ic_watch.svg",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "30 min",
                                style: AppUtils.textWhitePoppinsSemiBold9,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SvgPicture.asset(
                                Constants.assetIcon + "ic_serving.svg",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "3 people",
                                style: AppUtils.textWhitePoppinsSemiBold9,
                                textAlign: TextAlign.center,
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                Constants.assetIcon + "ic_save.svg",
                                height: 20,
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
