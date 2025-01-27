import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/chapter.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_list_view.dart';
import 'package:madagascar_workcoode/presentation/headline/subsection/subsection_list_view.dart';

class ChapterCard extends StatelessWidget {
  final Chapter chapter;

  const ChapterCard({
    super.key,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context) {
    final articles = chapter.articles;
    final sections = chapter.sections;
    return Card(
      color: Theme.of(context).colorScheme.inversePrimary.withValues(alpha: 0.3),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 5.0,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                "${chapter.value} : ${chapter.text}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            if (articles != null) ArticleListView(articles: articles),
            if (sections != null) SectionListView(sections: sections),
          ],
        ),
      ),
    );
  }
}
