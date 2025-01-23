import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/chapter.dart';

class Headline {
  final String value;
  final String text;
  final List<Chapter>? chapters;
  final List<Article>? articles;

  Headline({
    required this.value,
    required this.text,
    this.chapters,
    this.articles,
  });

  Headline.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String,
        text = json["text"] as String,
        chapters = json["chapters"] == null
            ? null
            : (json['chapters'] as List<dynamic>)
                .map(
                  (e) => Chapter.fromJson(e),
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
