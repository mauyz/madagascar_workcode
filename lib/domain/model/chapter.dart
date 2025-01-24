import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/section.dart';

class Chapter {
  final String value;
  final String text;
  final List<Section>? sections;
  final List<Article>? articles;

  Chapter({
    required this.value,
    required this.text,
    this.sections,
    this.articles,
  });

  Chapter.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String,
        text = json["text"] as String,
        sections = json["sections"] == null
            ? null
            : (json['sections'] as List<dynamic>)
                .map(
                  (e) => Section.fromJson(e),
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
      'sections': sections?.map((section) => section.toJson()).toList(),
      'articles': articles?.map((article) => article.toJson()).toList(),
    };
  }
}
