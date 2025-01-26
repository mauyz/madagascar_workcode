import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/presentation/article/article_content_page.dart';
import 'package:madagascar_workcoode/presentation/home/home_page.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: "/articles/:id",
          builder: (context, state) {
            final param = state.pathParameters["id"];
            if (param != null) {
              try {
                final id = int.tryParse(param);
                if (id != null && id > 0 && id < 396) {
                  return ArticleContentPage(id: id);
                }
              } catch (_) {}
            }
            return NotFoundPage();
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return NotFoundPage();
  },
);
