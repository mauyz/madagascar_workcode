import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/domain/model/headline.dart';
import 'package:madagascar_workcoode/presentation/admob/interstitial_ad_manager.dart';
import 'package:madagascar_workcoode/presentation/explorer/widget/articles_list_view.dart';

class HeadlineTitle extends StatelessWidget {
  final Headline headline;
  final int index;

  const HeadlineTitle({
    super.key,
    required this.headline,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        shadowColor: Colors.red,
        elevation: 1,
        child: InkWell(
          onTap: () {
            context.go("/headlines/$index");
            final random = Random();
            int numb1 = (random.nextDouble() * (11 - 1)).toInt();
            int numb2 = (random.nextDouble() * (11 - 1)).toInt();
            int numb3 = (random.nextDouble() * (11 - 1)).toInt();
            if (index == numb1 || index == numb2 || index == numb3) {
              InterstitialAdManager.show();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "${headline.value} : ${headline.text}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                  child: Text(
                    '(Art.${headline.allArticles.first.number} - '
                    'Art.${headline.allArticles.last.number})',
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                ),
                ArticlesListView(
                  headline: headline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
