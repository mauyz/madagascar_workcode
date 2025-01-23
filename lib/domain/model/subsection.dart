import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/symbol_section.dart';

class Subsection {
  final String value;
  final String text;
  final List<SymbolSection>? symbols;
  final List<Article>? articles;

  Subsection({
    required this.value,
    required this.text,
    this.symbols,
    this.articles,
  });

  Subsection.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String,
        text = json["text"] as String,
        symbols = json["symbols"] == null
            ? null
            : (json['symbols'] as List<dynamic>)
                .map(
                  (e) => SymbolSection.fromJson(e),
                )
                .toList(),
        articles = json['articles'] == null
            ? null
            : (json['articles'] as List<dynamic>)
                .map(
                  (e) => Article.fromJson(e),
                )
                .toList();
}
