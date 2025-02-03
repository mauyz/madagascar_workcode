import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:madagascar_workcoode/presentation/article/article_content_page.dart';
import 'package:madagascar_workcoode/presentation/headline/headline_page.dart';
import 'package:madagascar_workcoode/presentation/headline/introduction_page.dart';
import 'package:madagascar_workcoode/presentation/home/home_page.dart';
import 'package:madagascar_workcoode/presentation/not_found_page.dart';
import 'package:madagascar_workcoode/presentation/search/search_page.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: "articles/:id",
          pageBuilder: (_, state) {
            return _buildPageWithDefaultTransition(
              state: state,
              child: Builder(
                builder: (_) {
                  final id = int.tryParse(state.pathParameters["id"] ?? '');
                  if (id != null && id > 0 && id < 396) {
                    return ArticleContentPage(id: id);
                  }
                  return NotFoundPage();
                },
              ),
            );
          },
        ),
        GoRoute(
          path: "intro",
          pageBuilder: (_, state) {
            return _buildPageWithDefaultTransition(
              state: state,
              child: IntroductionPage(),
            );
          },
        ),
        GoRoute(
          path: "headlines/:index",
          pageBuilder: (_, state) {
            return _buildPageWithDefaultTransition(
              state: state,
              child: Builder(
                builder: (_) {
                  final index =
                      int.tryParse(state.pathParameters["index"] ?? '');
                  if (index != null && index > 0 && index < 12) {
                    return HeadlinePage(index: index);
                  }
                  return NotFoundPage();
                },
              ),
            );
          },
          routes: [
            GoRoute(
              path: "articles/:id",
              pageBuilder: (_, state) {
                return _buildPageWithDefaultTransition(
                  state: state,
                  child: Builder(
                    builder: (_) {
                      final id = int.tryParse(state.pathParameters["id"] ?? '');
                      if (id != null && id > 0 && id < 396) {
                        return ArticleContentPage(id: id);
                      }
                      return NotFoundPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "search",
          pageBuilder: (_, state) {
            return _buildPageWithDefaultTransition(
              state: state,
              child: SearchPage(),
            );
          },
          routes: [
            GoRoute(
              path: "articles/:id",
              pageBuilder: (_, state) {
                return _buildPageWithDefaultTransition(
                  state: state,
                  child: Builder(
                    builder: (_) {
                      final id = int.tryParse(state.pathParameters["id"] ?? '');
                      if (id != null && id > 0 && id < 396) {
                        return ArticleContentPage(id: id);
                      }
                      return NotFoundPage();
                    },
                  ),
                );
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

CustomTransitionPage<T> _buildPageWithDefaultTransition<T>({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(
        opacity: CurveTween(
          curve: Curves.easeInOutCirc,
        ).animate(animation),
        child: child,
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}
