import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationController extends GetxController
    with GetTickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  // double topBarOpacity = 0.0;

  final _topBarOpacity = 0.0.obs;
  double get topBarOpacity => _topBarOpacity.value;
  int count = 9;

  final _visible = false.obs;
  bool get visible => _visible.value;
  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    topBarAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController!,
      curve: Interval((1 / 10) * 1, 1.0, curve: Curves.fastOutSlowIn),
    ));
    super.onInit();
  }
}
