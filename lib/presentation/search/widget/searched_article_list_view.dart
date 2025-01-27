import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/presentation/search/widget/searched_article_card.dart';

class SearchedArticleListView extends StatelessWidget {
  final List<Article> articles;
  final String word;

  const SearchedArticleListView({
    super.key,
    required this.articles,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return SearchedArticleCard(
          article: articles[index],
          word: word,
        );
      },
    );
  }
}
