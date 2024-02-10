import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/ui/login/model/GetLoginSuccessData.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/utils/prefutils.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController
    with GetTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? topBarAnimation;

  final ScrollController scrollController = ScrollController();

  final _visible = false.obs;
  bool get visible => _visible.value;

  String name = '';
  String email = '';
  String image = "";
  @override
  void onInit() {
    var usertoken = PreferenceUtils.getString(Constants.prefLogin);
    debugPrint(usertoken);
    if (usertoken != null) {
      Map<String, dynamic> tokenObj = jsonDecode(usertoken);
      var tokenData = LoginItem.fromJson(tokenObj);
      image = tokenData.image ?? '';
      name = tokenData.name ?? '';
      email = tokenData.email ?? '';
    }

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

  void logout() async {
    await PreferenceUtils.clear();
    AppUtils.toastMessage("successfully logout");
    AppRouter.onBoarding();
  }
}
