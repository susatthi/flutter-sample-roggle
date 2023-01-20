// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $firstRoute,
    ];

GoRoute get $firstRoute => GoRouteData.$route(
      path: '/',
      factory: $FirstRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'second',
          factory: $SecondRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'third',
              factory: $ThirdRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $FirstRouteExtension on FirstRoute {
  static FirstRoute _fromState(GoRouterState state) => const FirstRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SecondRouteExtension on SecondRoute {
  static SecondRoute _fromState(GoRouterState state) => const SecondRoute();

  String get location => GoRouteData.$location(
        '/second',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ThirdRouteExtension on ThirdRoute {
  static ThirdRoute _fromState(GoRouterState state) => const ThirdRoute();

  String get location => GoRouteData.$location(
        '/second/third',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
