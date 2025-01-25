import 'package:flutter/material.dart';
import 'package:madagascar_workcoode/app/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          elevation: 5,
        ),
        useMaterial3: true,
      ),
    );
  }
}
