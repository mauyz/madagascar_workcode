import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/domain/model/headline.dart';

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
                    style: const TextStyle(
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 40),
                  child: CarouselView.weighted(
                    onTap: (value) {
                      final article = headline.allArticles[value];
                      context.go("/articles/${article.number}");
                    },
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    flexWeights: const <int>[2, 2, 2],
                    consumeMaxWeight: true,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
