import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/ui/home/model/getAllRecipeData.dart';

import '../../../config/App_Theme.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';

class RecipeView extends StatefulWidget {
  final List<RecipeItem> recipeList;
  RecipeView(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      required this.recipeList})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // addHomeLoader();
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 60 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 25,
              // widget.recipeList.length,
              itemBuilder: (BuildContext context, int index) {
                //  final int count =
                //       // widget.categoryList!.length > 10
                //       (10 == 8) ? 10 : 3;
                final int count = widget.recipeList.length > 10
                    ? 10
                    : widget.recipeList!.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController?.forward();

                int reverseIndex = widget.recipeList.length - 1 - index;
                final item = widget.recipeList[reverseIndex];
                return InkWell(
                  onTap: () {
                    AppRouter.homeDetailRoute(item);
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
                                            color:
                                                AppTheme.black.withOpacity(0.5),
                                            blurRadius: 25,
                                            spreadRadius: 2)
                                      ],
                                      color: AppTheme.lightPrimary
                                          .withOpacity(0.2),
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
                                            color:
                                                AppTheme.black.withOpacity(0.5),
                                            blurRadius: 10,
                                            spreadRadius: 2)
                                      ],
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(Constants.assetImage +
                                            "ic_launcher.png"),
                                      ),
                                      color: AppTheme.primary,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(10))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(10)),
                                    child: CachedNetworkImage(
                                        height: 80,
                                        width: 80,
                                        imageUrl: item.image ?? '',
                                        fit: BoxFit.contain,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                                  width: 80.0,
                                                  height: 80.0,
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
                                ),
                              ),
                              Positioned(
                                  bottom: 16,
                                  top: 16,
                                  right: 20,
                                  left: 110,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name.toString(),
                                        // "Maxican Burger Maxican BurgerMaxican BurgerMaxican BurgerMaxican Burger",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            AppUtils.textWhitePoppinsSemiBold16,
                                        textAlign: TextAlign.center,
                                      ),
                                      // SizedBox(
                                      //   height: 6,
                                      // ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Constants.assetIcon +
                                                "ic_watch.svg",
                                            height: 18,
                                            width: 18,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          (item.totalTime == "null" ||
                                                  item.totalTime == "0")
                                              ? Text(
                                                  "Under 30 min",
                                                  style: AppUtils
                                                      .textWhitePoppinsSemiBold9,
                                                  textAlign: TextAlign.center,
                                                )
                                              : Text(
                                                  "${item.totalTime} min" ?? "",
                                                  style: AppUtils
                                                      .textWhitePoppinsSemiBold9,
                                                  textAlign: TextAlign.center,
                                                ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          SvgPicture.asset(
                                            Constants.assetIcon +
                                                "ic_serving.svg",
                                            height: 18,
                                            width: 18,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "${item.serving.toString()} people",
                                            style: AppUtils
                                                .textWhitePoppinsSemiBold9,
                                            textAlign: TextAlign.center,
                                          ),
                                          Spacer(),
                                          // SvgPicture.asset(
                                          //   Constants.assetIcon + "ic_save.svg",
                                          //   height: 20,
                                          //   width: 20,
                                          // ),
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
              },
            ),
          ),
        );
      },
    );
  }
}





// ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 scrollDirection: Axis.vertical,
//                 itemCount: 10,
//                 itemBuilder: (BuildContext context, int index) {
//                   // final int count = widget.categoryList!.length > 10
//                   // 10==8  ? 10
//                   // : widget.categoryList!.length;
//                   final Animation<double> animation =
//                       Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                           parent: animationController!,
//                           curve: Interval((1 / 10) * index, 1.5,
//                               curve: Curves.fastOutSlowIn)));
//                   animationController?.forward();
    
//                   return Container(color: AppTheme.grey,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 90,
//                             width: 12,
//                             decoration: BoxDecoration(
//                                 color: AppTheme.secondary,
//                                 borderRadius: BorderRadius.circular(50)),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Container(
//                             height: 90,
//                             width: 330,
//                             // width: AppUtils.width(context)-70,
//                             decoration: BoxDecoration(
//                                 color: AppTheme.primary,
//                                 borderRadius: BorderRadius.only(
//                                     bottomLeft: Radius.circular(25),
//                                     bottomRight: Radius.circular(10),
//                                     topLeft: Radius.circular(25),
//                                     topRight: Radius.circular(25))),
                  
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   // right: 25,
//                                   left: 30,
//                                   top: 13, bottom: 13,
//                                   child: Container(
//                                     height: 65,
//                                     width: 65,
//                                     decoration: BoxDecoration(
//                                         boxShadow: [
//                                           BoxShadow(
//                                               color:
//                                                   AppTheme.black.withOpacity(0.5),
//                                               blurRadius: 25,
//                                               spreadRadius: 2)
//                                         ],
//                                         color:
//                                             AppTheme.lightPrimary.withOpacity(0.2),
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(20),
//                                             topRight: Radius.circular(10),
//                                             bottomLeft: Radius.circular(20),
//                                             bottomRight: Radius.circular(10))),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 6,
//                                   left: 6,
//                                   top: 6,
//                                   child: Container(
//                                     height: 80,
//                                     width: 80,
//                                     decoration: BoxDecoration(
//                                         boxShadow: [
//                                           BoxShadow(
//                                               color:
//                                                   AppTheme.black.withOpacity(0.5),
//                                               blurRadius: 10,
//                                               spreadRadius: 2)
//                                         ],
//                                         image: DecorationImage(
//                                           fit: BoxFit.fill,
//                                           image: AssetImage(
//                                               Constants.assetImage + "ic_food.png"),
//                                         ),
//                                         color: AppTheme.primary,
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(20),
//                                             topRight: Radius.circular(10),
//                                             bottomLeft: Radius.circular(20),
//                                             bottomRight: Radius.circular(10))),
//                                   ),
//                                 ),
//                                 Positioned(
//                                     bottom: 16,
//                                     top: 16,
//                                     right: 20,
//                                     left: 110,
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Maxican Burger Maxican BurgerMaxican BurgerMaxican BurgerMaxican Burger",
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style:
//                                               AppUtils.textWhitePoppinsSemiBold16,
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         // SizedBox(
//                                         //   height: 6,
//                                         // ),
//                                         Spacer(),
//                                         Row(
//                                           children: [
//                                             SvgPicture.asset(
//                                               Constants.assetIcon + "ic_watch.svg",
//                                               height: 18,
//                                               width: 18,
//                                             ),
//                                             SizedBox(
//                                               width: 8,
//                                             ),
//                                             Text(
//                                               "30 min",
//                                               style: AppUtils
//                                                   .textWhitePoppinsSemiBold9,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                             SizedBox(
//                                               width: 15,
//                                             ),
//                                             SvgPicture.asset(
//                                               Constants.assetIcon +
//                                                   "ic_serving.svg",
//                                               height: 18,
//                                               width: 18,
//                                             ),
//                                             SizedBox(
//                                               width: 8,
//                                             ),
//                                             Text(
//                                               "3 people",
//                                               style: AppUtils
//                                                   .textWhitePoppinsSemiBold9,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                             Spacer(),
//                                             SvgPicture.asset(
//                                               Constants.assetIcon + "ic_save.svg",
//                                               height: 20,
//                                               width: 20,
              //                               ),
              //                             ],
              //                           )
              //                         ],
              //                       ))
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),