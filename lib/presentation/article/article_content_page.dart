import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';

class ArticleContentPage extends StatelessWidget {
  final int id;

  const ArticleContentPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorerBloc, ExplorerState>(
      builder: (context, state) {
        final Widget widget;
        switch (state) {
          case ExplorerLoading():
            widget = Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ExplorerFailed():
            widget = NotFoundPage();
            break;
          case ExplorerSuccess():
            {
              final article = state.workCode.allArticles[id - 1];
              widget = Scaffold(
                appBar: AppBar(
                  title: Text(article.title),
                ),
                body: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    right: 12.0,
                    left: 12.0,
                  ),
                  child: SelectableText(
                    article.content,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }
        }
        return widget;
      },
    );
  }
}
