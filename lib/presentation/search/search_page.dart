import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/search/bloc/search_bloc.dart';
import 'package:madagascar_workcoode/presentation/search/bloc/search_state.dart';
import 'package:madagascar_workcoode/presentation/search/widget/search_input_widget.dart';
import 'package:madagascar_workcoode/presentation/search/widget/search_result_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: SearchInputWidget(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return switch (state) {
                SearchInitial() => const SizedBox.shrink(),
                SearchLoading() => Center(
                    child: CircularProgressIndicator(),
                  ),
                SearchSuccess() => SearchResultView(
                    articles: state.articles,
                    word: state.word,
                  )
              };
            },
          ),
        ),
      ),
    );
  }
}
