import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/symbol_section.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_list_view.dart';

class SymbolCard extends StatelessWidget {
  final SymbolSection symbol;

  const SymbolCard({
    super.key,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.2),
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
                "${symbol.value} : ${symbol.text}",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            ArticleListView(
              articles: symbol.articles,
            ),
          ],
        ),
      ),
    );
  }
}
