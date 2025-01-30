import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/search/bloc/search_bloc.dart';
import 'package:madagascar_workcoode/presentation/search/bloc/search_event.dart';
import 'package:madagascar_workcoode/presentation/search/bloc/search_state.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    if (searchBloc.state is SearchSuccess) {
      searchController.text = (searchBloc.state as SearchSuccess).word;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 500),
      child: IntrinsicWidth(
        stepWidth: 500,
        child: TextField(
          autofocus: true,
          controller: searchController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary.withValues(
                  alpha: 0.5,
                ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(80),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            hintText: "Rechercher",
            suffixIcon: IconButton(
              onPressed: () {
                searchController.clear();
                searchBloc.add(ClearSearchEvent());
              },
              icon: const Icon(
                Icons.close,
              ),
            ),
          ),
          onChanged: (value) {
            searchBloc.add(value.isEmpty
                ? ClearSearchEvent()
                : SearchWordEvent(word: value));
          },
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ),
    );
  }
}
