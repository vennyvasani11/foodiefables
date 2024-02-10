import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:foodiefables/Repository/home_repository.dart';
import 'package:foodiefables/routes/app_router.dart';
import 'package:foodiefables/ui/login/model/GetLoginSuccessData.dart';
import 'package:foodiefables/utils/Constant.dart';
import 'package:foodiefables/utils/app_utils.dart';
import 'package:foodiefables/utils/prefutils.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController with GetTickerProviderStateMixin {
  HomeRepository homeRepository;
  LoginController(
    this.homeRepository,
  );
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

  final _status = Rx(RxStatus.empty());
  RxStatus get status => _status.value;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  login() async {
    AppUtils.isConnected().then((intenet) async {
      if (intenet != null && intenet) {
        _status.value = RxStatus.loading();
        try {
          final response = await homeRepository.allRecipeCall(request: {
            "dataSource": Constants.data_source,
            "database": Constants.data_base,
            "collection": Constants.login,
            "filter": {"email": emailController.text.trim()}
          });

          debugPrint("Response ******>$response");
          _status.value = RxStatus.success();
          var obj = GetLoginSuccessData.fromJson(response);

          if (obj.documents != []) {
            await PreferenceUtils.setString(
                Constants.prefLogin, json.encode(obj.documents?[0]));

          
            PreferenceUtils.setBool(Constants.isLoginDone, true);
            PreferenceUtils.setBool(Constants.isIntroDone, true);
            AppUtils.toastMessage("Login Successfully");
            FirebaseMessaging.instance
                .getToken()
                .then((value) => print("token    $value"));
            AppRouter.cooking();
          } 
        } catch (e) {
          AppUtils.toastMessage("Detail Not Found");
          _status.value = RxStatus.error(e.toString());
        }
      } else {
        AppUtils.toastMessage('Please Check Internet.');
      }
    });
  }

  void socialSignUp(String name, String email, String photo) {
    AppUtils.isConnected().then((intenet) async {
      if (intenet != null && intenet) {
        _status.value = RxStatus.loading();
        try {
          final response = await homeRepository.registerCall(request: {
            "dataSource": Constants.data_source,
            "database": Constants.data_base,
            "collection": Constants.login,
            "document": {
              "name": name,
              "image": photo,
              "email": email,
              "password": "${name.removeAllWhitespace}@123"
            }
          });

          debugPrint("Response ******>$response");
          _status.value = RxStatus.success();
          var obj = GetLoginSuccessData.fromJson(response);

          if (obj.documents != []) {
            await PreferenceUtils.setString(
                Constants.prefLogin, json.encode(obj));
            PreferenceUtils.setBool(Constants.isLoginDone, true);
            PreferenceUtils.setBool(Constants.isIntroDone, true);
            AppUtils.toastMessage("Login Successfully");
            FirebaseMessaging.instance.getToken().then((value) {
              PreferenceUtils.setString(Constants.LOGIN_TOKEN, value ?? '');
            });
            AppRouter.cooking();
          }
        } catch (e) {
          AppUtils.toastMessage(e.toString());
          _status.value = RxStatus.error(e.toString());
        }
      } else {
        AppUtils.toastMessage('Please Check Internet.');
      }
    });
  }

  String name = '';
  String email = '';
  String image = "";

  void loginGoogle() async {
    _status.value = RxStatus.loading();

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    _googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
      GoogleSignInAuthentication? auth = await acc?.authentication;
      debugPrint(acc?.id);
      debugPrint(acc?.email);
      debugPrint(acc?.displayName);
      debugPrint(acc?.photoUrl);

      acc?.authentication.then((GoogleSignInAuthentication auth) async {
        debugPrint(auth.idToken);
        debugPrint(auth.accessToken);
      });

      if (acc?.email != null) {
        if (acc?.email != "") {
          emailController.text = acc?.email ?? '';
          image = acc?.photoUrl ?? '';
          name = acc?.displayName ?? '';

            socialSignUp(name, email, image);

          _googleSignIn.signOut();
        } else {
          AppUtils.toastMessage('Something went wrong! \n Please Try again...');
        }
      } else {
        AppUtils.toastMessage('Something went wrong! \n Please Try again...');
      }
    });
  }
}
