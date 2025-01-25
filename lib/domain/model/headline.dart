import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/chapter.dart';
import 'package:madagascar_workcoode/domain/model/section.dart';
import 'package:madagascar_workcoode/domain/model/subsection.dart';
import 'package:madagascar_workcoode/domain/model/symbol_section.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'text': text,
      'chapters': chapters?.map((chapter) => chapter.toJson()).toList(),
      'articles': articles?.map((article) => article.toJson()).toList(),
    };
  }

  List<Article> get allArticles {
    final articleList = <Article>[];
    if (articles != null) {
      articleList.addAll(articles!);
    }
    if (chapters != null) {
      for (Chapter chapter in chapters!) {
        if (chapter.articles != null) {
          articleList.addAll(chapter.articles!);
        }
        final sections = chapter.sections;
        if (sections != null) {
          for (Section section in sections) {
            if (section.articles != null) {
              articleList.addAll(section.articles!);
            }
            final subsections = section.subsections;
            if (subsections != null) {
              for (Subsection subsection in subsections) {
                if (subsection.articles != null) {
                  articleList.addAll(subsection.articles!);
                }
                final symbols = subsection.symbols;
                if (symbols != null) {
                  for (SymbolSection symbol in symbols) {
                    articleList.addAll(symbol.articles);
                  }
                }
              }
            }
            final symbols = section.symbols;
            if (symbols != null) {
              for (SymbolSection symbol in symbols) {
                articleList.addAll(symbol.articles);
              }
            }
          }
        }
      }
    }
    articleList.sort(
      (a, b) => a.number.compareTo(b.number),
    );
    return articleList;
  }
}
