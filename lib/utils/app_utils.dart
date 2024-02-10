import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/App_Theme.dart';

class AppUtils {static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
  static TextStyle textWhiteRancho20 = TextStyle(
      letterSpacing: 0.9,
      fontFamily: "Rancho",
      color: AppTheme.white,
      fontWeight: FontWeight.w500,
      fontSize: 20);

  static TextStyle textWhiteRancho32 = TextStyle(
      letterSpacing: 0.9,
      fontFamily: "Rancho",
      color: AppTheme.white,
      fontWeight: FontWeight.w500,
      fontSize: 32);
  static TextStyle textWhiteRancho66 = TextStyle(
      fontFamily: "Rancho",
      color: AppTheme.white,
      fontWeight: FontWeight.w300,
      fontSize: 66);

//==============================================================
//==============================================================
//==============================================================

  static TextStyle textoffGreyPlayFairRegular12 = const TextStyle(
      fontFamily: "PlayfairDisplay",
      color: AppTheme.offGrey,
      fontWeight: FontWeight.w300,
      fontSize: 12);

//==============================================================
//==============================================================
//==============================================================
  static TextStyle textWhitePlayFairSemiBold16 = const TextStyle(
      fontFamily: "PlayfairDisplay",
      color: AppTheme.white,
      fontWeight: FontWeight.w700,
      fontSize: 16);

  static TextStyle textWhitePlayFairSemiBold20 = const TextStyle(
      fontFamily: "PlayfairDisplay",
      color: AppTheme.white,
      fontWeight: FontWeight.w700,
      fontSize: 20);

  static TextStyle textWhitePlayFairSemiBold32 = const TextStyle(
      fontFamily: "PlayfairDisplay",
      color: AppTheme.white,
      fontWeight: FontWeight.w700,
      fontSize: 32);

//==============================================================
//==============================================================
//==============================================================

  //regular=300
  //medium=500
  //semibold=700

  static TextStyle textlightGreyPoppinsRegular14 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.lightGrey,
      fontWeight: FontWeight.w300,
      fontSize: 14);

  static TextStyle textWhitePoppinsRegular16 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w300,
      fontSize: 16);

  static TextStyle textWhitePoppinsRegular18 =  TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w300,shadows: [Shadow(color: AppTheme.black.withOpacity(0.5),blurRadius: 25)],
      fontSize: 18);



      
  static TextStyle textWhitePoppinsRegular24 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w300,
      fontSize: 24);

//==============================================================
//==============================================================
//==============================================================
  static TextStyle textWhitePoppinsMedium10 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w500,
      fontSize: 10);

  static TextStyle textWhitePoppinsMedium12 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w500,
      fontSize: 12);
  static TextStyle textWhitePoppinsMedium16 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w500,
      fontSize: 16);

  static TextStyle textWhitePoppinsMedium18 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w500,
      fontSize: 18);


      static TextStyle textBlackPoppinsMedium20 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.black,
      fontWeight: FontWeight.w500,
      fontSize: 20);

//==============================================================
//==============================================================
//==============================================================

  static TextStyle textWhitePoppinsSemiBold7 = const TextStyle(
      fontFamily: "Poppins",
      letterSpacing: 0.2,
      color: AppTheme.white,
      fontWeight: FontWeight.w700,
      fontSize: 7);

  static TextStyle textWhitePoppinsSemiBold9 = const TextStyle(
      fontFamily: "Poppins",
      letterSpacing: 0.2,
      color: AppTheme.white,
      fontWeight: FontWeight.w700,
      fontSize: 9);

      static TextStyle textWhitePoppinsSemiBold12 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w700,
      fontSize: 12);

  static TextStyle textWhitePoppinsSemiBold16 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w700,
      fontSize: 16);

//==============================================================
//==============================================================
//==============================================================
  static TextStyle textmediumGreyPoppinsLight8 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.mediumGrey,
      fontWeight: FontWeight.w300,height: 1.1,
      fontSize: 10);

  static TextStyle textWhitePoppinsLight9 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w300,
      fontSize: 9);


  static TextStyle textWhitePoppinsLight14 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.white,
      fontWeight: FontWeight.w300,
      fontSize: 14);

  static TextStyle textoffGreyPoppinsLight14 = const TextStyle(
      fontFamily: "Poppins",
      color: AppTheme.offGrey,
      fontWeight: FontWeight.w300,
      fontSize: 14);




      

  //==============================================================
//==============================================================
//==============================================================

  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static goBack(BuildContext context) {
    return Navigator.pop(context);
  }



  
static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}




// Poppins
// PlayfairDisplay
// Rancho