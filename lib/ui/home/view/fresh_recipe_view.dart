import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/ui/home/model/getAllRecipeData.dart';


import '../../../config/App_Theme.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';

class FreshrecipeView extends StatefulWidget {
  List<RecipeItem> categoryList;
  FreshrecipeView(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      required this.categoryList})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _FreshrecipeViewState createState() => _FreshrecipeViewState();
}

class _FreshrecipeViewState extends State<FreshrecipeView>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
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
            child: Container(
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 12),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final int count = 5 > 10 ? 10 : 5;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();
                  var item = widget.categoryList[index];
                  return AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                        opacity: animation!,
                        child: Transform(
                            transform: Matrix4.translationValues(
                                100 * (1.0 - animation!.value), 0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: InkWell(
                                onTap: () {
                                  AppRouter.homeDetailRoute(item);
                                },
                                child: SizedBox(
                                    height: 290,
                                    width: 240,
                                    child: Container(
                                      height: 280,
                                      width: 220,
                                      decoration: BoxDecoration(
                                          color: AppTheme.primary,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(80),
                                              topLeft: Radius.circular(80),
                                              topRight: Radius.circular(80))),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: 25,
                                            left: 25,
                                            top: 31,
                                            child: Container(
                                              height: 180,
                                              width: 190,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: AppTheme.black
                                                            .withOpacity(0.5),
                                                        blurRadius: 25,
                                                        spreadRadius: 2)
                                                  ],
                                                  color: AppTheme.lightPrimary
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(70),
                                                          topRight:
                                                              Radius.circular(
                                                                  70),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                          ),
                                          Positioned(
                                            right: 16,
                                            left: 16,
                                            top: 16,
                                            child: Container(
                                              height: 180,
                                              width: 210,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: AppTheme.black
                                                            .withOpacity(0.5),
                                                        blurRadius: 10,
                                                        spreadRadius: 2)
                                                  ],
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        Constants.assetImage +
                                                            "ic_launcher.png"),
                                                  ),
                                                  color: AppTheme.primary,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(70),
                                                          topRight:
                                                              Radius.circular(
                                                                  70),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(70),
                                                    topRight:
                                                        Radius.circular(70),
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                child: CachedNetworkImage(
                                                    height: 80,
                                                    width: 80,
                                                    imageUrl: item.image ?? '',
                                                    fit: BoxFit.contain,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .fill),
                                                          ),
                                                        ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Text("F")
                                                    // Image.asset(
                                                    //     '${Constants.assetImage}ic_no_image.png')

                                                    ),
                                              ),
                                            ),
                                          ),
                                          // Positioned(
                                          //   bottom: 100,
                                          //   right: 30,
                                          //   child: SvgPicture.asset(
                                          //     Constants.assetIcon + "ic_save.svg",
                                          //     height: 24,
                                          //     width: 24,
                                          //   ),
                                          // ),
                                          Positioned(
                                              bottom: 14,
                                              right: 16,
                                              left: 16,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    child: Text(
                                                      item.name.toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: AppUtils
                                                          .textWhitePoppinsSemiBold16,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
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
                                                      (item.totalTime ==
                                                                  "null" ||
                                                              item.totalTime ==
                                                                  "0")
                                                          ? Text(
                                                              "Under 30 min",
                                                              style: AppUtils
                                                                  .textWhitePoppinsSemiBold9,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )
                                                          : Text(
                                                              "${item.totalTime} min" ??
                                                                  "",
                                                              style: AppUtils
                                                                  .textWhitePoppinsSemiBold9,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                        "${item.serving} people",
                                                        style: AppUtils
                                                            .textWhitePoppinsSemiBold9,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    )),
                              ),
                            )),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
