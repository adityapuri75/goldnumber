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
        // adUnitId: "ca-app-pub-5219606438368552/1918101307",
        adUnitId: BannerAd.testAdUnitId,
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  static InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  }
}