import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moein_moradi/core/global/app_global.dart';
import 'package:moein_moradi/features/articles/presentation/pages/articles_layout.dart';
import 'package:moein_moradi/features/home/presentation/pages/home_page.dart';
import 'package:moein_moradi/features/skills/presentation/pages/skills_tab_layout.dart';
import 'package:moein_moradi/features/home/presentation/pages/splash_page.dart';
import 'package:moein_moradi/features/package/presentation/pages/packages_layout.dart';
import 'package:moein_moradi/features/projects/presentation/pages/projects_layout.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    navigatorKey: AppGlobal.mainKey,
    initialLocation: RouterKey.splash,
    routes: [
      GoRoute(
        path: RouterKey.splash,
        name: "Splash",
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: SplashPage(
              key: Key(RouterKey.splash),
            ),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return NoTransitionPage(
            child: HomePage(
              child: navigationShell,
            ),
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouterKey.packages,
                name: "Packages",
                builder: (context, state) {
                  return const PackagesLayout();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouterKey.projects,
                name: "Projects",
                builder: (context, state) {
                  return const ProjectsLayout();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouterKey.skills,
                name: "Skills",
                builder: (context, state) {
                  return const SkillsLayout();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouterKey.articles,
                name: "Articles",
                builder: (context, state) {
                  return const ArticlesLayout();
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return _errorRoute();
    },
  );

  static Widget _errorRoute() {
    return const Scaffold(
      body: Center(
        child: Text("Page not found!"),
      ),
    );
  }
}

class RouterKey {
  static const String splash = "/splash";
  static const String packages = "/";
  static const String projects = "/projects";
  static const String skills = "/skills";
  static const String articles = "/articles";
}
