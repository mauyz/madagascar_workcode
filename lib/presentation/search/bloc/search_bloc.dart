import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/core/service_locator.dart';
import 'package:madagascar_workcoode/domain/repository/work_code_repository.dart';
import 'package:madagascar_workcoode/presentation/search/bloc/search_event.dart';
import 'package:madagascar_workcoode/presentation/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<ClearSearchEvent>(_clearSearch);
    on<SearchWordEvent>(_searchWord);
  }

  void _clearSearch(
    ClearSearchEvent event,
    Emitter<SearchState> emitter,
  ) {
    emitter(SearchInitial());
  }

  void _searchWord(
    SearchWordEvent event,
    Emitter<SearchState> emitter,
  ) async {
    final repository = locator.get<WorkCodeRepository>();
    emitter(SearchLoading());
    final result = await repository.searchArticle(event.word);
    emitter(
      SearchSuccess(articles: result, word: event.word),
    );
  }
}
