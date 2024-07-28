import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiefables/ui/food_category/model/categorydata.dart';
import 'package:foodiefables/widget/background_image.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../config/App_Theme.dart';
import '../../../routes/app_router.dart';
import '../../../utils/Constant.dart';
import '../../../utils/app_utils.dart';

class FoodCategoryRoute extends StatefulWidget {
  const FoodCategoryRoute({super.key});

  @override
  State<FoodCategoryRoute> createState() => _FoodCategoryRouteState();
}

class _FoodCategoryRouteState extends State<FoodCategoryRoute>
    with TickerProviderStateMixin {
  bool visible = false;
  int percent = 0;
  List<CategoryData> visibleList = [];

  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    visibleList.add(CategoryData(false, "Bread", "bread.svg"));
    visibleList.add(CategoryData(false, "Butter", "butter.svg"));
    visibleList.add(CategoryData(false, "Cake", "cake.svg"));
    visibleList.add(CategoryData(false, "Cheese", "cheese.svg"));
    visibleList.add(CategoryData(false, "Chicken", "chicken.svg"));
    visibleList.add(CategoryData(false, "Chocolate", "chocolate.svg"));
    visibleList.add(CategoryData(false, "Cookie", "cookie.svg"));
    visibleList.add(CategoryData(false, "Drink", "dink.svg"));
    visibleList.add(CategoryData(false, "Egg", "egg.svg"));
    visibleList.add(CategoryData(false, "Fre. Fires", "frenchfries.svg"));
    visibleList.add(CategoryData(false, "Ice cream", "icecream.svg"));
    visibleList.add(CategoryData(false, "Meat", "meat.svg"));
    visibleList.add(CategoryData(false, "Potato", "potato.svg"));
    visibleList.add(CategoryData(false, "Salad", "salad.svg"));

    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Interval((1 / 10) * 1, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    animationController?.forward();
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: animationController!,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                      opacity: animation!,
                      child: Transform(
                        transform: Matrix4.translationValues(
                            0.0, 50 * (1.0 - animation.value), 0.0),
                        child: AspectRatio(
                          aspectRatio: 1.4,
                          child: Image.asset(
                            Constants.assetImage + "ic_image_4.png",
                            // height: 200,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        AppRouter.splash();
                      },
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            color: AppTheme.secondary,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: AppTheme.black,
                                  blurRadius: 15,
                                  spreadRadius: 5)
                            ]),
                        child: Center(
                            child: Text(
                          "Skip",
                          style: AppUtils.textWhitePoppinsRegular16,
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Food Categories?",
                    style: AppUtils.textWhitePoppinsMedium16,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: StepProgressIndicator(
                    totalSteps: 9,
                    currentStep: percent,
                    size: 8,
                    selectedColor: AppTheme.white,
                    unselectedColor: AppTheme.darkGrey,
                    roundedEdges: Radius.circular(10),
                  ),

                  //  child: LinearPercentIndicator(
                  //   lineHeight: 9,
                  //   animation: true,
                  //   progressColor: AppTheme.white,
                  //   backgroundColor: AppTheme.darkGrey,
                  //   barRadius: Radius.circular(10),
                  //   percent: percent,
                  // )
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: visibleList.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var item = visibleList[index];
                    final int count =
                        visibleList.length > 10 ? 10 : visibleList.length;
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
                          opacity: animation,
                          child: Transform(
                            transform: Matrix4.translationValues(
                                0.0, 100 * (1.0 - animation.value), 0.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (item.isSelected == false &&
                                      percent == 0) {
                                    percent = 1;
                                    item.isSelected = true;
                                  } else if (item.isSelected == false &&
                                      percent < 9) {
                                    percent++;
                                    item.isSelected = true;
                                  } else if (item.isSelected == true &&
                                      percent == 1) {
                                    percent = 0;
                                    item.isSelected = false;
                                  } else if (item.isSelected == true &&
                                      percent < 9) {
                                    percent--;
                                    item.isSelected = false;
                                  } else if (item.isSelected == false &&
                                      percent == 9) {
                                    item.isSelected = false;
                                  }
                                });
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    alignment: Alignment.center,
                                    // padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppTheme.black,
                                              spreadRadius: 10,
                                              blurRadius: 15)
                                        ],
                                        // image: DecorationImage(
                                        //     image: AssetImage(
                                        //         "${Constants.assetImage}ic_food.png")),
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(20, 50)),
                                        border: Border.all(
                                            width: 7,
                                            color: item.isSelected
                                                ? AppTheme.white
                                                : AppTheme.darkGrey)),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        Constants.categoryImage + item.image,
                                        height: 80,width: 80,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    item.title,
                                    style:item.isSelected? AppUtils.textWhitePoppinsMedium16: AppUtils.textgreyPoppinsMedium16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class FoodCategoryRoute extends StatelessWidget {
//   const FoodCategoryRoute({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           BackgroundImage(),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Image.asset(
//                   Constants.assetImage + "ic_image_4.png",
//                   // height: 200,
//                   fit: BoxFit.fill,
//                   width: double.infinity,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         AppRouter.COOKING();
//                       },
//                       child: Container(
//                         height: 35,
//                         width: 80,
//                         decoration: BoxDecoration(
//                             color: AppTheme.secondary,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: AppTheme.black,
//                                   blurRadius: 15,
//                                   spreadRadius: 5)
//                             ]),
//                         child: Center(
//                             child: Text(
//                           "Skip",
//                           style: AppUtils.textWhitePoppinsRegular16,
//                           textAlign: TextAlign.center,
//                         )),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 30,
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 50),
//                   child: Text(
//                     "Food Categories?",
//                     style: AppUtils.textWhitePoppinsMedium16,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: StepProgressIndicator(
//                     totalSteps: 9,
//                     currentStep: 1,
//                     size: 8,
//                     selectedColor: AppTheme.white,
//                     unselectedColor: AppTheme.darkGrey,
//                     roundedEdges: Radius.circular(10),
//                   ),

//                   //  LinearPercentIndicator(
//                   //   lineHeight: 9,
//                   //   animation: true,
//                   //   progressColor: AppTheme.white,
//                   //   backgroundColor: AppTheme.darkGrey,
//                   //   barRadius: Radius.circular(10),
//                   //   percent: percent,
//                   // )
//                 ),

//                 GridView.builder(shrinkWrap: true,itemCount: 10,physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2),
//                   itemBuilder: (context, index) {
//                     return InkWell(onTap: () {

//                     },
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             width: 150,
//                             alignment: Alignment.center,
//                             // padding: const EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage(
//                                         "${Constants.assetImage}ic_food.png")),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.elliptical(20, 50)),
//                                 border: Border.all(
//                                     width: 7, color: AppTheme.darkGrey)),
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             "Chocolate",
//                             style: AppUtils.textWhitePoppinsMedium16,
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
