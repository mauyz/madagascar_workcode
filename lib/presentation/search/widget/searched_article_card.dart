import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:madagascar_workcoode/domain/model/article.dart';

class SearchedArticleCard extends StatelessWidget {
  final Article article;
  final String word;

  const SearchedArticleCard({
    super.key,
    required this.article,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onSecondary.withValues(
            alpha: 0.5,
          ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          context.go("${GoRouter.of(context).state.matchedLocation}"
              "/articles/${article.number}");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Text(
                article.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextHighlight(
                  text: article.content,
                  words: {
                    word: HighlightedWord(
                      textStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  },
                  matchCase: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
