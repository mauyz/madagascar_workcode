import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_cubit.dart';
import 'package:madagascar_workcoode/presentation/admob/ad_banner_widget.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_state.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';
import 'package:share_plus/share_plus.dart';

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
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: IconButton(
                      onPressed: () {
                        Share.share(
                          state.workCode.introduction,
                          subject: "Introduction",
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
                    child: Scrollbar(
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
                  if (!kIsWeb)
                    SafeArea(
                      child: BlocProvider<AdBannerCubit>(
                        create: (context) => AdBannerCubit(null),
                        child: AdBannerWidget(),
                      ),
                    ),
                ],
              ),
            ),
        };
      },
    );
  }
}
