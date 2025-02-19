import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/domain/model/chapter.dart';
import 'package:madagascar_workcoode/domain/model/headline.dart';
import 'package:madagascar_workcoode/domain/model/section.dart';
import 'package:madagascar_workcoode/domain/model/subsection.dart';
import 'package:madagascar_workcoode/domain/model/symbol_section.dart';
import 'package:madagascar_workcoode/domain/model/tree_object.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_cubit.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_widget.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/headline/article/article_list_view.dart';
import 'package:madagascar_workcoode/presentation/headline/chapter/chapter_list_view.dart';
import 'package:madagascar_workcoode/presentation/headline/tree/headline_tree_view.dart';
import 'package:madagascar_workcoode/presentation/headline/tree_view_type_cubit.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';

class HeadlinePage extends StatefulWidget {
  final int index;

  const HeadlinePage({
    super.key,
    required this.index,
  });

  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  TreeNode<TreeObject>? tree;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorerBloc, ExplorerState>(
      builder: (context, state) {
        final Widget component;
        switch (state) {
          case ExplorerLoading():
            component = Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ExplorerFailed():
            component = NotFoundPage();
            break;
          case ExplorerSuccess():
            {
              final headline = state.workCode.headlines[widget.index - 1];
              tree ??= _getTreeNode(headline);
              final articles = headline.articles;
              final chapters = headline.chapters;
              component = BlocBuilder<TreeViewTypeCubit, bool>(
                builder: (_, treeView) {
                  return Scaffold(
                    appBar: AppBar(
                      title: AutoSizeText(
                        "${headline.value} : ${headline.text}",
                        maxLines: 3,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: IconButton(
                            onPressed: () {
                              context.read<TreeViewTypeCubit>().toggle();
                              tree = _getTreeNode(headline);
                            },
                            icon: Icon(
                              treeView
                                  ? Icons.list_alt_outlined
                                  : Icons.account_tree_outlined,
                            ),
                          ),
                        )
                      ],
                    ),
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 10,
                            ),
                            child: treeView
                                ? HeadlineTreeView(
                                    tree: tree!,
                                  )
                                : SingleChildScrollView(
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
                        ),
                        if (!kIsWeb)
                          SafeArea(
                            child: BlocProvider<AdBannerCubit>(
                              create: (context) => AdBannerCubit(null),
                              child: AdBannerWidget(),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              );
            }
        }
        return component;
      },
    );
  }

  TreeNode<TreeObject> _getTreeNode(Headline headline) {
    final result = TreeNode<TreeObject>.root();

    final articles = headline.articles;
    if (articles != null) {
      result.addAll(articles
          .map(
            (e) => TreeNode<TreeObject>(
              key: e.title,
              data: e,
            ),
          )
          .toList());
    }
    final chapters = headline.chapters;
    if (chapters != null) {
      for (Chapter chapter in chapters) {
        final chapterTree = TreeNode<TreeObject>(
          key: chapter.value,
          data: chapter,
        );
        if (chapter.articles != null) {
          chapterTree.addAll(chapter.articles!
              .map(
                (e) => TreeNode<TreeObject>(
                  key: e.title,
                  data: e,
                ),
              )
              .toList());
        }
        final sections = chapter.sections;
        if (sections != null) {
          for (Section section in sections) {
            final sectionTree = TreeNode<TreeObject>(
              key: section.value,
              data: section,
            );
            if (section.articles != null) {
              sectionTree.addAll(section.articles!
                  .map(
                    (e) => TreeNode<TreeObject>(
                      key: e.title,
                      data: e,
                    ),
                  )
                  .toList());
            }
            final subsections = section.subsections;
            if (subsections != null) {
              for (Subsection subsection in subsections) {
                final subSectionTree = TreeNode<TreeObject>(
                  key: subsection.value,
                  data: subsection,
                );
                if (subsection.articles != null) {
                  subSectionTree.addAll(subsection.articles!
                      .map(
                        (e) => TreeNode<TreeObject>(
                          key: e.title,
                          data: e,
                        ),
                      )
                      .toList());
                }
                final symbols = subsection.symbols;
                if (symbols != null) {
                  for (SymbolSection symbol in symbols) {
                    final symbolSectionTree = TreeNode<TreeObject>(
                      key: symbol.value,
                      data: symbol,
                    );
                    symbolSectionTree.addAll(symbol.articles
                        .map(
                          (e) => TreeNode<TreeObject>(
                            key: e.title,
                            data: e,
                          ),
                        )
                        .toList());
                    subSectionTree.add(symbolSectionTree);
                  }
                }
                sectionTree.add(subSectionTree);
              }
            }
            final symbols = section.symbols;
            if (symbols != null) {
              for (SymbolSection symbol in symbols) {
                final symbolTree = TreeNode<TreeObject>(
                  key: symbol.value,
                  data: symbol,
                );
                symbolTree.addAll(symbol.articles
                    .map(
                      (e) => TreeNode<TreeObject>(
                        key: e.title,
                        data: e,
                      ),
                    )
                    .toList());
                sectionTree.add(symbolTree);
              }
            }
            chapterTree.add(sectionTree);
          }
        }
        result.add(chapterTree);
      }
    }
    return result;
  }
}
