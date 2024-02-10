import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../config/App_Theme.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';
import '../model/getAllCategoryData.dart';

class CategoryListview extends StatefulWidget {
  List<CategoryItem> categoryList;
  CategoryListview(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      required this.categoryList})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _CategoryListviewState createState() => _CategoryListviewState();
}

class _CategoryListviewState extends State<CategoryListview>
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
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Container(
              height: 90,
              width: double.infinity,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  final int count = widget.categoryList.length > 10
                          ? 10
                          : widget.categoryList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                        opacity: animationController!,
                        child: Transform(
                            transform: Matrix4.translationValues(
                                100 * (1.0 - animationController!.value),
                                0.0,
                                1.0),
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: AppTheme.primary,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 70,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: AppTheme.primary,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 11,
                                          left: 11,
                                          top: 9,
                                          child: Container(
                                            height: 40,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppTheme.black
                                                          .withOpacity(0.5),
                                                      blurRadius: 25,
                                                      spreadRadius: 2)
                                                ],
                                                color: AppTheme.lightPrimary
                                                    .withOpacity(0.4),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          left: 5,
                                          top: 5,
                                          child: Container(
                                            height: 40,
                                            width: 32,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppTheme.black
                                                          .withOpacity(0.5),
                                                      blurRadius: 5,
                                                      spreadRadius: 2)
                                                ],
                                                // image: DecorationImage(
                                                //   fit: BoxFit.fill,
                                                //   image: AssetImage(
                                                //       Constants.assetImage +
                                                //           "ic_launcher.png"),
                                                // ),
                                                color: AppTheme.primary,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5))),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5)),
                                              child: CachedNetworkImage(
                                                  height: 80,
                                                  width: 80,
                                                  imageUrl: widget
                                                          .categoryList![index]
                                                          .image ??
                                                      '',
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
                                                              fit: BoxFit.fill),
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
                                        Positioned(
                                            bottom: 8,
                                            right: 6,
                                            left: 6,
                                            child: Text(
                                              widget.categoryList![index].title
                                                  .toString(),
                                              style: AppUtils
                                                  .textWhitePoppinsSemiBold7,
                                              textAlign: TextAlign.center,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
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
