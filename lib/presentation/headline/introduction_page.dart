import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return BlocBuilder<ExplorerBloc, ExplorerState>(
      builder: (context, state) {
        return switch (state) {
          ExplorerLoading() => Center(
              child: CircularProgressIndicator(),
            ),
          ExplorerFailed() => NotFoundPage(),
          ExplorerSuccess() => Scaffold(
              appBar: AppBar(
                title: Text("Introduction"),
              ),
              body: Scrollbar(
                thumbVisibility: true,
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SelectableText(
                      state.workCode.introduction,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        };
      },
    );
  }
}
