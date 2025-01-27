import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/domain/model/symbol_section.dart';
import 'package:madagascar_workcoode/presentation/headline/symbol/symbol_card.dart';

class SymbolListView extends StatelessWidget {
  final List<SymbolSection> symbols;

  const SymbolListView({
    super.key,
    required this.symbols,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: symbols.length,
      itemBuilder: (_, index) {
        return SymbolCard(
          symbol: symbols[index],
        );
      },
    );
  }
}
