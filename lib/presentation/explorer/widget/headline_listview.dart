import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/headline.dart';
import 'package:madagascar_workcoode/presentation/explorer/widget/headline_title.dart';
import 'package:madagascar_workcoode/presentation/explorer/widget/introduction_title.dart';

class HeadlineListview extends StatelessWidget {
  final List<Headline> headlines;

  const HeadlineListview({
    super.key,
    required this.headlines,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: headlines.length + 1,
      itemBuilder: (context, index) {
          if(index == 0) {
            return IntroductionTitle();
          }
          return HeadlineTitle(headline: headlines[index - 1]);
      },
    );
  }
}
