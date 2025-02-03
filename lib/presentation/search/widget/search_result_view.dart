import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/presentation/search/widget/searched_article_card.dart';

class SearchResultView extends StatelessWidget {
  final List<Article> articles;
  final String word;

  const SearchResultView({
    super.key,
    required this.articles,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) {
      return const Center(
        child: Text('Aucun résultat'),
      );
    }
    final scrollController = ScrollController();
    final resultText =
    articles.length > 1 ? "articles trouvés" : "article trouvé";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "${articles.length} $resultText",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            controller: scrollController,
            thumbVisibility: true,
            child: ListView.builder(
              controller: scrollController,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return SearchedArticleCard(
                  article: articles[index],
                  word: word,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}