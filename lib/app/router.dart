import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/presentation/article/article_content_page.dart';
import 'package:madagascar_workcoode/presentation/headline/headline_page.dart';
import 'package:madagascar_workcoode/presentation/headline/introduction_page.dart';
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
          path: "articles/:id",
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters["id"] ?? '');
            if (id != null && id > 0 && id < 396) {
              return ArticleContentPage(id: id);
            }
            return NotFoundPage();
          },
        ),
        GoRoute(
          path: "intro",
          builder: (context, state) => IntroductionPage(),
        ),
        GoRoute(
          path: "headlines/:index",
          builder: (context, state) {
            final index = int.tryParse(state.pathParameters["index"] ?? '');
            if (index != null && index > 0 && index < 12) {
              return HeadlinePage(index: index);
            }
            return NotFoundPage();
          },
          routes: [
            GoRoute(
              path: "articles/:id",
              builder: (context, state) {
                final id = int.tryParse(state.pathParameters["id"] ?? '');
                if (id != null && id > 0 && id < 396) {
                  return ArticleContentPage(id: id);
                }
                return NotFoundPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) {
    return NotFoundPage();
  },
);
