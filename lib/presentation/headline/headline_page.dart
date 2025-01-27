import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_list_view.dart';
import 'package:madagascar_workcoode/presentation/headline/chapter/chapter_list_view.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';

class HeadlinePage extends StatelessWidget {
  final int index;

  const HeadlinePage({
    super.key,
    required this.index,
  });

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
              final headline = state.workCode.headlines[index - 1];
              final articles = headline.articles;
              final chapters = headline.chapters;
              widget = Scaffold(
                appBar: AppBar(
                  title: AutoSizeText(
                    "${headline.value} : ${headline.text}",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(
                    5.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 5.0,
                      children: [
                        if (articles != null)
                          ArticleListView(articles: articles),
                        if (chapters != null)
                          ChapterListView(chapters: chapters),
                      ],
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
