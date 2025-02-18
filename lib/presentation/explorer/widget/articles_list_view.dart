import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/domain/model/headline.dart';

class ArticlesListView extends StatelessWidget {
  final Headline headline;

  const ArticlesListView({
    super.key,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 40),
      child: CarouselView.weighted(
        onTap: (value) {
          final article = headline.allArticles[value];
          context.go("/articles/${article.number}");
        },
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        flexWeights: _getFlexWeights(deviceWidth),
        consumeMaxWeight: false,
        children: headline.allArticles.map(
          (e) {
            return Center(
              child: Text(
                "Art. ${e.number}",
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  List<int> _getFlexWeights(double deviceWidth) {
    return switch (deviceWidth) {
      < 400 => const [1, 1, 1, 1],
      < 600 => const [1, 1, 1, 1, 1],
      < 800 => const [1, 1, 1, 1, 1, 1, 1],
      < 1000 => const [1, 1, 1, 1, 1, 1, 1, 1],
      _ => const [1, 1, 1, 1, 1, 1, 1, 1, 1],
    };
  }
}
