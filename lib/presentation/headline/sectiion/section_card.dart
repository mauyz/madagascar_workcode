import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/section.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_list_view.dart';
import 'package:madagascar_workcoode/presentation/headline/sectiion/section_list_view.dart';
import 'package:madagascar_workcoode/presentation/headline/symbol/symbol_list_view.dart';

class SectionCard extends StatelessWidget {
  final Section section;

  const SectionCard({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final articles = section.articles;
    final symbols = section.symbols;
    final subsections = section.subsections;
    return Card(
      color: Theme.of(context).colorScheme.inversePrimary.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 5.0,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${section.value} : ${section.text}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            if (articles != null) ArticleListView(articles: articles),
            if (symbols != null) SymbolListView(symbols: symbols),
            if (subsections != null)
              SubsectionListView(subsections: subsections),
          ],
        ),
      ),
    );
  }
}
