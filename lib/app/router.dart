import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/presentation/home/home_page.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomePage(),
    )
  ],
);
