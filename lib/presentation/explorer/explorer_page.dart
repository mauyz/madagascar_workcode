import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_event.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/explorer/widget/headline_listview.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExplorerBloc>(
      lazy: false,
      create: (context) => ExplorerBloc(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ExplorerBloc, ExplorerState>(
          builder: (context, state) {
            return switch (state) {
              ExplorerLoading() => Center(
                  child: CircularProgressIndicator(),
                ),
              ExplorerFailed() => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Text("Impossible de charger les données"),
                      FilledButton(
                        onPressed: () {
                          BlocProvider.of<ExplorerBloc>(context)
                              .add(ExplorerLoadEvent());
                        },
                        child: Text("Réessayer"),
                      )
                    ],
                  ),
                ),
              ExplorerSuccess() => HeadlineListview(
                  headlines: state.workCode.headlines,
                ),
            };
          },
        ),
      ),
    );
  }
}
