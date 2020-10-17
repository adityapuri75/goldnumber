import 'package:firebase_admob/firebase_admob.dart';

class Ads{

     static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
    nonPersonalizedAds: true,
    childDirected: true,
    keywords: <String>[
      'Game',
      "Education",
      "trading"
          "Books",
      "Flutter",
      "Shoping",
      "Ipl",
      "cricket",
      "youtube",
      "faug",
    ],
  );

  static BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: "ca-app-pub-2230868896500775/8621497998",

        //Change BannerAd adUnitId with Admob ID
        size: AdSize.smartBanner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  static InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: "ca-app-pub-2230868896500775/4682252984",
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  }
}