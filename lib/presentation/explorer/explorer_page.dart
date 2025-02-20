import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_cubit.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_widget.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_event.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/explorer/widget/headline_listview.dart';

class ExplorerPage extends StatelessWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExplorerBloc, ExplorerState>(
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
          ExplorerSuccess() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: HeadlineListview(
                    headlines: state.workCode.headlines,
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
        };
      },
    );
  }
}
