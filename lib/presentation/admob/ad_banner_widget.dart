import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_cubit.dart';

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    context.read<AdBannerCubit>().loadAd(
          deviceWidth,
          forceLoad: true,
        );
    return BlocBuilder<AdBannerCubit, BannerAd?>(
      builder: (context, bannerAd) {
        if (bannerAd == null) {
          return SizedBox.shrink();
        }
        return Container(
          color: Theme.of(context).colorScheme.onPrimary,
          width: bannerAd.size.width.toDouble(),
          height: bannerAd.size.height.toDouble(),
          child: AdWidget(ad: bannerAd),
        );
      },
    );
  }
}
