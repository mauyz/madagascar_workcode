import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madagascar_workcoode/app/bloc/dark_mode_cubit.dart';
import 'package:madagascar_workcoode/app/router.dart';
import 'package:madagascar_workcoode/core/service_locator.dart';
import 'package:madagascar_workcoode/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:madagascar_workcoode/presentation/headline/tree_view_type_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DarkModeCubit>(
          create: (_) => DarkModeCubit(
            locator.get<SharedPreferences>().getBool("darkMode") ?? false,
          ),
        ),
        BlocProvider<TreeViewTypeCubit>(
          create: (_) => TreeViewTypeCubit(
            locator.get<SharedPreferences>().getBool("viewType") ?? true,
          ),
        ),
        BlocProvider<ExplorerBloc>(
          lazy: false,
          create: (context) => ExplorerBloc(),
        ),
      ],
      child: BlocBuilder<DarkModeCubit, bool>(
        builder: (context, mode) {
          return MaterialApp.router(
            routerConfig: router,
            scrollBehavior: AppScrollBehavior(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.indigo,
                brightness: mode ? Brightness.dark : Brightness.light,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 0.0,
                shadowColor: Theme.of(context).colorScheme.onPrimary,
                elevation: 1.0,
              ),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
