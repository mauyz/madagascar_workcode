import 'package:madagascar_workcoode/domain/model/article.dart';
import 'package:madagascar_workcoode/domain/model/chapter.dart';
import 'package:madagascar_workcoode/domain/model/headline.dart';
import 'package:madagascar_workcoode/domain/model/section.dart';
import 'package:madagascar_workcoode/domain/model/subsection.dart';
import 'package:madagascar_workcoode/domain/model/symbol_section.dart';

class WorkCode {
  final String introduction;
  final List<Headline> headlines;

  WorkCode({
    required this.introduction,
    required this.headlines,
  });

  WorkCode.fromJson(Map<String, dynamic> json)
      : introduction = json["introduction"] as String,
        headlines = (json["headlines"] as List<dynamic>)
            .map(
              (e) => Headline.fromJson(e),
            )
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'introduction': introduction,
      'headlines': headlines.map((headline) => headline.toJson()).toList(),
    };
  }

  List<Article> get allArticles {
    List<Article> articleList = [];
    for (Headline headline in headlines) {
      if (headline.articles != null) {
        articleList.addAll(headline.articles!);
      }
      final chapters = headline.chapters;
      if (chapters != null) {
        for (Chapter chapter in chapters) {
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
    }
    articleList.sort(
      (a, b) => a.number.compareTo(b.number),
    );
    return articleList;
  }
}
