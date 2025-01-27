import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/subsection.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_list_view.dart';
import 'package:madagascar_workcoode/presentation/headline/symbol/symbol_list_view.dart';

class SubsectionCard extends StatelessWidget {
  final Subsection subsection;

  const SubsectionCard({
    super.key,
    required this.subsection,
  });

  @override
  Widget build(BuildContext context) {
    final articles = subsection.articles;
    final symbols = subsection.symbols;
    return Card(
      color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.4),
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
                "${subsection.value} : ${subsection.text}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            if (articles != null) ArticleListView(articles: articles),
            if (symbols != null) SymbolListView(symbols: symbols),
          ],
        ),
      ),
    );
  }
}
