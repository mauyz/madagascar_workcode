import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdManager {
  static void show() {
    InterstitialAd.load(
      adUnitId: kDebugMode
          ? 'ca-app-pub-3940256099942544/1033173712'
          : "ca-app-pub-4557811309342801/9892908717",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.show();
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, _) {
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (_) {},
      ),
    );
  }
}
