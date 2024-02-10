import 'package:flutter/material.dart';

class AppTheme {
  static const backgroudcolor1 = Color(0xFF16080B);
  static const backgroudcolor2 = Color(0xFF070202);
  static const backgroudcolor3 = Color(0xff000000);
  static const backgroundimage1 = Color(0xff3E0101);
  static const backgroundimage2 = Color(0xffD46966);
  static const backgroundimage3 = Color(0xff3E0101);
  static const backgroundimage4 = Color(0xFF140909);
  static const primary = Color(0xff5C363E);
  static const secondary = Color(0xffD46966);
  static const darkerText = Color(0xFF17262A);
  static const white = Color(0xffffffff);
  static const grey = Color(0xffD9D9D9);
  static const black = Color(0xff000000);
  static const lightGrey = Color(0xff7A7A7A);
  static const darkGrey = Color(0xff343434);
  static const lightPrimary = Color(0xffFFD7D7);
  static const searchDarkGrey = Color(0xff555555);
  static const mediumGrey = Color(0xffCAC6C6);
  static const offGrey = Color(0xffD6D6D6);

//background1
  // static const   backgroudcolor1 =            Color(0xFF16080B);
  // static const   backgroudcolor2 =            Color(0xFF070202);
  // static const   backgroudcolor3 =            Color(0xff000000);
  // static const   backgroudcolor3 =            Color(0xff000000);
  // static const   backgroudcolor3 =            Color(0xff000000);
  // static const   backgroudcolor2 =            Color(0xFF070202);
  // static const   backgroudcolor1 =            Color(0xFF1A0A0D);

//=========================================================//
  //background2

  // static const   primary    =  Color(0xff5C363E);
  // static const    backgroundimage1   =  Color(0xff3E0101).withOpacity(0.65);
  // static const   backgroundimage2   =  Color(0xffD46966).withOpacity(0.65);
  // static const    backgroundimage3   =  Color(0xff3E0101).withOpacity(0.65);
  // static const    primary   =  Color(0xff5C363E);
  // static const    black   =  Color(0xFF140909).withAlpha(245);
  // static const      primary =  Color(0xff5C363E);



   static final Map<int, Color> primaryColorMap = {
    50: primary.withOpacity(0.1),
    100: primary.withOpacity(0.2),
    200: primary.withOpacity(0.3),
    300: primary.withOpacity(0.4),
    400: primary.withOpacity(0.5),
    500: primary.withOpacity(0.6),
    600: primary.withOpacity(0.7),
    700: primary.withOpacity(0.8),
    800: primary.withOpacity(0.9),
    900: primary.withOpacity(1),
  };

  static final MaterialColor primaryMaterialColor =
      MaterialColor(primary.value, primaryColorMap);

  static final light = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryMaterialColor, accentColor: secondary),
      scaffoldBackgroundColor: Colors.white,
      dividerColor: secondary);
}
