import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerCubit extends Cubit<BannerAd?> {
  AdBannerCubit(super.initialState);

  @override
  Future<void> close() {
    state?.dispose();
    return super.close();
  }

  void loadAd(
    double screenWith, {
    bool? forceLoad,
  }) async {
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      screenWith.truncate(),
    );
    if ((state != null && forceLoad != true) || size == null) {
      return;
    }
    await state?.dispose();
    emit(null);
    debugPrint("Load banner");
    BannerAd(
      adUnitId: kDebugMode
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-4557811309342801/1350938246',
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          emit(ad as BannerAd);
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    ).load();
  }
}
