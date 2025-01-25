import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/presentation/explorer/explorer_page.dart';
import 'package:madagascar_workcoode/presentation/home/navigation_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationCubit>(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Text("Code de travail"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilledButton.tonalIcon(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                ),
                label: Text("Rechercher"),
              ),
            )
          ],
        ),
        body: BlocBuilder<NavigationCubit, int>(builder: (context, page) {
          if(page == 0) {
            return ExplorerPage();
          }
          return Center(
            child: FilledButton(onPressed: () {}, child: Text("Page $page")),
          );
        }),
        bottomNavigationBar:
            BlocBuilder<NavigationCubit, int>(builder: (context, page) {
          return NavigationBar(
            onDestinationSelected: (int index) {
              context.read<NavigationCubit>().navigate(index);
            },
            selectedIndex: page,
            destinations: const <Widget>[
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
          );
        }),
      ),
    );
  }
}
