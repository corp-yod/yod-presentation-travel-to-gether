import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yod_presentation_travel_to_gether/route.dart';
import 'package:yod_presentation_travel_to_gether/route_name.dart';
import 'package:yod_presentation_travel_to_gether/presentation/main_app.dart';

void main() {
  group('RouteNameTravel', () {
    test('travelMainApp constant should have correct value', () {
      expect(RouteNameTravel.travelMainApp, '/travelMainApp');
    });
  });

  group('TravelToGetherDomain', () {
    late TravelToGetherDomain domain;

    setUp(() {
      domain = TravelToGetherDomain();
    });

    test('init() should execute without errors', () {
      expect(() {
        domain.init();
      }, returnsNormally);
    });

    test('routes() should return expected set of route names', () {
      final routes = domain.routes();

      expect(routes, isA<Set<String>>());
      expect(routes, contains(RouteNameTravel.travelMainApp));
      expect(routes.length, 2);
    });

    group('onGenerateRoute', () {
      test(
        'should return PageRouteBuilder for travelMainApp route with MainApp widget',
        () {
          final routeSettings = RouteSettings(
            name: RouteNameTravel.travelMainApp,
          );
          final route = domain.onGenerateRoute(routeSettings);

          expect(route, isNotNull);
          expect(route, isA<PageRouteBuilder>());
          expect(route?.settings.name, RouteNameTravel.travelMainApp);
        },
      );

      test('onGenerateRoute returns null for undefined routes', () {
        final routeSettings = RouteSettings(name: '/undefinedRoute');
        final route = domain.onGenerateRoute(routeSettings);

        expect(route, isNull);
      });

      test('PageRouteBuilder animation should build MainApp widget', () {
        final routeSettings = RouteSettings(
          name: RouteNameTravel.travelMainApp,
        );
        final route = domain.onGenerateRoute(routeSettings) as PageRouteBuilder;

        // Test the pageBuilder
        final widget = route.pageBuilder(
          _MockBuildContext(),
          kAlwaysCompleteAnimation,
          kAlwaysCompleteAnimation,
        );

        expect(widget, isA<MainApp>());
      });

      test('PageRouteBuilder transitionsBuilder creates SlideTransition', () {
        final routeSettings = RouteSettings(
          name: RouteNameTravel.travelMainApp,
        );
        final route = domain.onGenerateRoute(routeSettings) as PageRouteBuilder;

        // Test the transitionsBuilder
        final child = Container();
        final transitionWidget = route.transitionsBuilder(
          _MockBuildContext(),
          kAlwaysCompleteAnimation,
          kAlwaysCompleteAnimation,
          child,
        );

        expect(transitionWidget, isA<SlideTransition>());
      });
    });
  });

  group('Route Animation Tests', () {
    late TravelToGetherDomain domain;

    setUp(() {
      domain = TravelToGetherDomain();
    });

    test('route slide transition starts from right (Offset 1, 0)', () {
      final routeSettings = RouteSettings(name: RouteNameTravel.travelMainApp);
      final route = domain.onGenerateRoute(routeSettings) as PageRouteBuilder;

      final animation = AlwaysStoppedAnimation<double>(0.0);
      final child = Container();

      final transitionWidget = route.transitionsBuilder(
        _MockBuildContext(),
        animation,
        animation,
        child,
      );

      expect(transitionWidget, isA<SlideTransition>());
    });

    test('route slide transition ends at center (Offset 0, 0)', () {
      final routeSettings = RouteSettings(name: RouteNameTravel.travelMainApp);
      final route = domain.onGenerateRoute(routeSettings) as PageRouteBuilder;

      final animation = AlwaysStoppedAnimation<double>(1.0);
      final child = Container();

      final transitionWidget = route.transitionsBuilder(
        _MockBuildContext(),
        animation,
        animation,
        child,
      );

      expect(transitionWidget, isA<SlideTransition>());
    });
  });
}

// Mock BuildContext for testing using a minimal implementation
class _MockBuildContext extends Fake implements BuildContext {
  @override
  bool get mounted => true;
}
