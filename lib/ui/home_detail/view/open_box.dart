import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/widget/background_image.dart';

import 'package:get/get.dart';

import '../../../config/App_Theme.dart';
import '../../home/model/getAllRecipeData.dart';

class OpenBoxWidget extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final RecipeItem item;
  const OpenBoxWidget(
      {super.key,
      this.animationController,
      this.animation,
      required this.item});

  @override
  State<OpenBoxWidget> createState() => _OpenBoxWidgetState();
}




class _OpenBoxWidgetState extends State<OpenBoxWidget> {
  @override
  Widget build(BuildContext context) {
    widget.animationController?.forward();

    return Container(
      height: AppUtils.height(context),
      child: Stack(
        children: [
          BackgroundImage(),
          Positioned(
            right: 0,
            child: Container(
              height: AppUtils.height(context),
              child: Image.asset(
                Constants.assetImage + "ic_right_fruite.png",
              ),
            ),
          ),
          Positioned(
            left: 160,
            right: 160,
            child: Container(
              margin: EdgeInsets.all(8),
              height: 5,
              alignment: Alignment.center,
              width: 50,
              decoration: BoxDecoration(
                  color: AppTheme.secondary,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          AnimatedBuilder(
            animation: widget.animationController!,
            builder: (BuildContext context, Widget? child) {
              return FadeTransition(
                opacity: widget.animation!,
                child: new Transform(
                    transform: new Matrix4.translationValues(
                        0.0, 60 * (1.0 - widget.animation!.value), 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 25),
                          // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          height: 40,
                          width: 40, alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppTheme.secondary,
                              boxShadow: [
                                BoxShadow(
                                    color: AppTheme.black,
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 10)),
                              ],
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  AppUtils.goBack(context);
                                },
                                child: SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: SvgPicture.asset(
                                    Constants.assetIcon + "ic_back_arrow.svg",
                                  ),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 110),
                                  child: Text(
                                    widget.item.name.toString(),
                                    style: AppUtils.textWhitePlayFairSemiBold20,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                ListView.builder(
                                  padding: const EdgeInsets.only(
                                      left: 10,
                                      bottom: 110,
                                      top: 10,
                                      right: 110),
                                  itemCount: widget.item.instruction?.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    int item = index + 1;
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, right: 3),
                                          child: InkWell(onTap: () {
                                          },
                                            child: CircleAvatar(
                                              backgroundColor: AppTheme.primary
                                                  .withOpacity(0.6),
                                              radius: 10,
                                              child: Text(
                                                widget.item.instruction![index]
                                                    .position
                                                    .toString(),
                                                style: AppUtils
                                                    .textWhitePoppinsLight14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: AppUtils.width(context) - 150,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          decoration: BoxDecoration(
                                              color: AppTheme.primary
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            widget.item.instruction![index]
                                                .displayText
                                                .toString(),
                                            style: AppUtils
                                                .textWhitePoppinsLight14,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              );
            },
          ),

          // BackgroundImage(),
        ],
      ),
    );
  }
}
