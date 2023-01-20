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
  Widget build(BuildContext context) {
    return const FirstScreen();
  }
}

class SecondRoute extends GoRouteData {
  const SecondRoute();

  @override
  Widget build(BuildContext context) {
    return const SecondScreen();
  }
}

class ThirdRoute extends GoRouteData {
  const ThirdRoute();

  @override
  Widget build(BuildContext context) {
    return const ThirdScreen();
  }
}
