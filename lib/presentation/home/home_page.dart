import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/app/bloc/dark_mode_cubit.dart';
import 'package:madagascar_workcoode/presentation/about/about_page.dart';
import 'package:madagascar_workcoode/presentation/admob/interstitial_ad_manager.dart';
import 'package:madagascar_workcoode/presentation/explorer/explorer_page.dart';
import 'package:madagascar_workcoode/presentation/home/navigation_cubit.dart';
import 'package:madagascar_workcoode/presentation/pdf/pdf_view_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, page) {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 10.0,
              elevation: 2,
              title: const Text(
                "Code du travail",
              ),
              actions: [
                if (page != 2)
                  IconButton(
                    onPressed: () {
                      context.go("/search");
                    },
                    icon: const Icon(
                      Icons.search_rounded,
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<DarkModeCubit>(context).update();
                    if (BlocProvider.of<DarkModeCubit>(context).state &&
                        !kIsWeb) {
                      InterstitialAdManager.show();
                    }
                  },
                  icon: Icon(
                    Theme.of(context).brightness == Brightness.dark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: page,
              children: [
                const ExplorerPage(),
                const PdfViewPage(),
                const AboutPage(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              elevation: 5,
              onDestinationSelected: (int index) {
                if (page != index) {
                  context.read<NavigationCubit>().navigate(index);
                }
              },
              selectedIndex: page,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.list_alt),
                  label: 'Explorer',
                ),
                NavigationDestination(
                  icon: Icon(Icons.picture_as_pdf),
                  label: 'PDF',
                ),
                NavigationDestination(
                  icon: Icon(Icons.info_outlined),
                  label: 'A propos',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
