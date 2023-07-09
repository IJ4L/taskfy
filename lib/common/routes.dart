import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/presentation/pages/add_task_page.dart';
import 'package:task_app/presentation/pages/task_page.dart';
import 'package:task_app/presentation/pages/home_page.dart';

import '../presentation/pages/bottom_navigation_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

final router = GoRouter(
  initialLocation: HomePage.namePage,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: HomePage.namePage,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: HomePage());
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: TaskPage.namePage,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: TaskPage());
              },
              routes: [],
            ),
          ],
        )
      ],
    ),
    GoRoute(
      path: AddTaskPage.namePage,
      pageBuilder: (context, state) {
        return NoTransitionPage(child: const AddTaskPage());
      },
    ),
  ],
);
