import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/subsection.dart';
import 'package:madagascar_workcoode/domain/model/symbol_section.dart';

class Section {
  final String value;
  final String text;
  final List<Subsection>? subsections;
  final List<SymbolSection>? symbols;
  final List<Article>? articles;

  Section({
    required this.value,
    required this.text,
    this.subsections,
    this.symbols,
    this.articles,
  });

  Section.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String,
        text = json["text"] as String,
        subsections = json["subsections"] == null
            ? null
            : (json['subsections'] as List<dynamic>)
                .map(
                  (e) => Subsection.fromJson(e),
                )
                .toList(),
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

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'text': text,
      'subsections':
          subsections?.map((subsection) => subsection.toJson()).toList(),
      'symbols': symbols?.map((symbol) => symbol.toJson()).toList(),
      'articles': articles?.map((article) => article.toJson()).toList(),
    };
  }
}
