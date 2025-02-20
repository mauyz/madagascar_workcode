import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_cubit.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_widget.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';
import 'package:share_plus/share_plus.dart';

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
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: IconButton(
                        onPressed: () {
                          Share.share(
                            "${article.title.toUpperCase()}\n\n${article.content}",
                            subject: article.title,
                          );
                        },
                        icon: Icon(Icons.share),
                      ),
                    ),
                  ],
                ),
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          right: 12.0,
                          left: 12.0,
                          bottom: 5.0,
                        ),
                        child: SelectableText(
                          article.content,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    if (!kIsWeb)
                      BlocProvider<AdBannerCubit>(
                        create: (context) => AdBannerCubit(null),
                        child: const SafeArea(
                          child: AdBannerWidget(),
                        ),
                      ),
                  ],
                ),
              );
            }
        }
        return widget;
      },
    );
  }
}
