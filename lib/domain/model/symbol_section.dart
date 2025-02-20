import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/tree_object.dart';

class SymbolSection extends TreeObject {
  final String value;
  final String text;
  final List<Article> articles;

  SymbolSection({
    required this.value,
    required this.text,
    required this.articles,
  });

  SymbolSection.fromJson(Map<String, dynamic> json)
      : value = json["value"] as String,
        text = json['text'] as String,
        articles = (json["articles"] as List<dynamic>)
            .map(
              (e) => Article.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'text': text,
      'articles': articles.map((article) => article.toJson()).toList(),
    };
  }

  @override
  String getTreeTitle() {
    return "$value : $text";
  }
}
