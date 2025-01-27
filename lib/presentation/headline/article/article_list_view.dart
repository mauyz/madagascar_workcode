import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_card.dart';

class ArticleListView extends StatelessWidget {
  final List<Article> articles;

  const ArticleListView({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (_, index) {
        return ArticleCard(
          article: articles[index],
        );
      },
    );
  }
}
