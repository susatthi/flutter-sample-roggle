import 'package:flutter/material.dart';
import 'package:flutter_sample_roggle/main.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: $appRoutes,
);

@TypedGoRoute<FirstRoute>(
  path: '/',
  routes: [
    TypedGoRoute<SecondRoute>(
      path: 'second',
      routes: [
        TypedGoRoute<ThirdRoute>(
          path: 'third',
        ),
      ],
    ),
  ],
)
class FirstRoute extends GoRouteData {
  const FirstRoute();

  @override
  Page<void> buildPage(BuildContext context) => TransitionPage.slide(
        name: 'first',
        child: const FirstScreen(),
      );
}

class SecondRoute extends GoRouteData {
  const SecondRoute();

  @override
  Page<void> buildPage(BuildContext context) => TransitionPage.slide(
        name: 'second',
        child: const SecondScreen(),
      );
}

class ThirdRoute extends GoRouteData {
  const ThirdRoute();

  @override
  Page<void> buildPage(BuildContext context) => TransitionPage.slide(
        name: 'third',
        child: const ThirdScreen(),
      );
}

/// デフォルトのTransitionPage
class TransitionPage extends CustomTransitionPage<void> {
  const TransitionPage({
    required String name,
    required super.child,
    required super.transitionsBuilder,
    super.transitionDuration,
    super.maintainState,
    super.fullscreenDialog,
    super.opaque,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.key,
    super.arguments,
    super.restorationId,
  }) : super(
          name: name,
        );

  factory TransitionPage.fade({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _fadeTransitionsBuilder,
      );

  factory TransitionPage.slide({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _slideTransitionsBuilder,
      );

  factory TransitionPage.none({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _noneTransitionsBuilder,
      );

  static Widget _slideTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        ),
        child: child,
      );

  static Widget _fadeTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(opacity: animation, child: child);

  static Widget _noneTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}
