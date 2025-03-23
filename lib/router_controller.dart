import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hidden_labyrinths/screens/screens.dart';

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class RouterController {
  final router = GoRouter(
    initialLocation: '/loading',
    routes: [
      GoRoute(
        path: '/loading',
        builder: (context, state) => const LoadingScreen(),
      ),
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const MainScreen(),
        ),
        routes: [
          GoRoute(
            path: 'game',
            builder: (context, state) => const MainGameScreen(),
          ),
          GoRoute(
            path: 'puzzle',
            builder: (context, state) => const PuzzleScreen(),
          ),
          GoRoute(
            path: 'shop',
            builder: (context, state) => const ShopScreen(),
          ),
        ],
      ),
    ],
  );
}
