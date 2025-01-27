sealed class SearchEvent {}

class ClearSearchEvent extends SearchEvent {}

class SearchWordEvent extends SearchEvent {
  final String word;

  SearchWordEvent({required this.word});
}
