// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
BannerAd? bannerAd; // bannerAd pase add avse 

class AdHelper {



  BannerAd getBannerAd()  // function banavu je dependencies google_mobile_ads mathi aave che require che
  {
      bannerAd = BannerAd(  // BannerAd Widget che jani valua  bannerAd ne aapi bc.. jaya bolavu hoy tya bolavi sakay
        size: AdSize.banner,  //ADsize kay rese a set karvi pade jani height niche sizedbox ne davani hoy je google ne puchi levani
        adUnitId: 'ca-app-pub-6334779689731772/1366955316', // adUnitId a Text ads mate hoy jay re live app mate api thi set karvi pade
        listener: BannerAdListener(   // listener pase ads aavi k nay a khabar pade jethi aane hendal karva mate
          onAdFailedToLoad: (Ad ad,LoadAdError error) // ads ma error hoy to?
          {
            ad.dispose();   // jo ads ma error hoy to aane dispodse karo km k biji var request thay sake
          },
          onAdLoaded: (Ad ad){}, //jo Load thuy to kasu nay
          onAdOpened: (Ad ad){}  // jo ads par click thay ne ads open thay to coad karvo 
      ), 
      request: const AdRequest()  // request kare google ads ne add aape je ads AdRequest lay ne aave 
      );
    return bannerAd!;   // bannerAd return karavo jeni pase ads hase
  }

  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/7049598008';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/3964253750';
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return 'ca-app-pub-3940256099942544/8673189370';
  //   } else if (Platform.isIOS) {
  //     return 'ca-app-pub-3940256099942544/7552160883';
  //   } else {
  //     throw UnsupportedError('Unsupported platform');
  //   }
  // }
}
