import 'package:madagascar_workcoode/domain/model/article.dart';

sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Article> articles;
  final String word;

  SearchSuccess({
    required this.articles,
    required this.word,
  });
}
