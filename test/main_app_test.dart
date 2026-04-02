import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yod_presentation_travel_to_gether/presentation/main_app.dart';

void main() {
  group('MainApp Widget Tests', () {
    testWidgets('MainApp renders without crashing',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(MainApp), findsOneWidget);
    });

    testWidgets('MainApp contains Scaffold', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('MainApp has AppBar', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('MainApp has TabBarView', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(TabBarView), findsOneWidget);
    });

    testWidgets('MainApp has bottom TabBar', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(TabBar), findsOneWidget);
    });

    testWidgets('MainApp contains Tab widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(Tab), findsWidgets);
    });

    testWidgets('MainApp builds and pumps', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(MainApp), findsOneWidget);
    });

    testWidgets('MainApp has ClipRRect for styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(ClipRRect), findsOneWidget);
    });

    testWidgets('MainApp contains SafeArea', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      expect(find.byType(SafeArea), findsWidgets);
    });

    testWidgets('MainApp proper cleanup on dispose',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MainApp(),
        ),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Placeholder(),
        ),
      );

      expect(find.byType(MainApp), findsNothing);
    });
  });

}
