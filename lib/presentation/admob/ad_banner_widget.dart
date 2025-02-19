import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_cubit.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  late Orientation _currentOrientation;
  BannerAd? _bannerAd;

  @override
  void didChangeDependencies() {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    _currentOrientation = MediaQuery.of(context).orientation;
    context.read<AdBannerCubit>().loadAd(deviceWidth);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return BlocBuilder<AdBannerCubit, BannerAd?>(
      builder: (context, bannerAd) {
        _bannerAd = bannerAd;
        return OrientationBuilder(
          builder: (context, orientation) {
            if (_currentOrientation == orientation && _bannerAd != null) {
              return Container(
                color: Theme.of(context).colorScheme.onPrimary,
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              );
            }
            if (_currentOrientation != orientation) {
              _currentOrientation = orientation;
              context.read<AdBannerCubit>().loadAd(deviceWidth);
            }
            return SizedBox.shrink();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
