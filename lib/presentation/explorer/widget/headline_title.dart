import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/headline.dart';

class HeadlineTitle extends StatelessWidget {
  final Headline headline;

  const HeadlineTitle({
    super.key,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${headline.value} : ${headline.text}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 60),
                  child: CarouselView.weighted(
                    onTap: (value) {
                      final article = headline.allArticles[value];
                      debugPrint(article.title);
                    },
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    flexWeights: const <int>[2, 2, 2],
                    consumeMaxWeight: true,
                    children: headline.allArticles.map(
                      (e) {
                        return Center(
                          child: Text(
                            "Art. ${e.number}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
