import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yod_presentation_travel_to_gether/presentation/main_app_travel_together.dart';

void main() {
  group('MainAppTravelToGether Widget Tests', () {
    testWidgets('MainAppTravelToGether renders without crashing', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(MainAppTravelToGether), findsOneWidget);
    });

    testWidgets('MainAppTravelToGether contains Scaffold', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('MainAppTravelToGether has AppBar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('MainAppTravelToGether has TabBarView', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(TabBarView), findsOneWidget);
    });

    testWidgets('MainAppTravelToGether has bottom TabBar', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(TabBar), findsOneWidget);
    });

    testWidgets('MainAppTravelToGether contains Tab widgets', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(Tab), findsWidgets);
    });

    testWidgets('MainAppTravelToGether builds and pumps', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      await tester.pumpAndSettle();
      expect(find.byType(MainAppTravelToGether), findsOneWidget);
    });

    testWidgets('MainAppTravelToGether has ClipRRect for styling', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('MainAppTravelToGether contains SafeArea', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      expect(find.byType(SafeArea), findsWidgets);
    });

    testWidgets('MainAppTravelToGether proper cleanup on dispose', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: MainAppTravelToGether()));

      await tester.pumpWidget(const MaterialApp(home: Placeholder()));

      expect(find.byType(MainAppTravelToGether), findsNothing);
    });
  });
}
