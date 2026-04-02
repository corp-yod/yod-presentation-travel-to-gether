import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yod_presentation_travel_to_gether/presentation/home/home_screen.dart';

void main() {
  group('HomeScreen Unit Tests', () {
    test('HomeScreen.buildTabBar returns Tab widget', () {
      final homeScreen = HomeScreen();
      final tabWidget = homeScreen.buildTabBar();
      expect(tabWidget, isA<Tab>());
    });

    test('HomeScreen.buildTabBarView returns Padding widget', () {
      final homeScreen = HomeScreen();
      final viewWidget = homeScreen.buildTabBarView();
      expect(viewWidget, isA<Padding>());
    });

    test('HomeScreen tab has text "บ้าน"', () {
      final tab = HomeScreen().buildTabBar() as Tab;
      expect(tab.text, 'บ้าน');
    });

    test('HomeScreen tab has icon', () {
      final tab = HomeScreen().buildTabBar() as Tab;
      expect(tab.icon, isNotNull);
    });

    test('CreateTripButton constructor works', () {
      void callback() {}
      final button = CreateTripButton(onPressed: callback);
      expect(button.onPressed, callback);
    });
  });

  group('CreateTripButton Widget Tests', () {
    testWidgets('CreateTripButton renders', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CreateTripButton(onPressed: () {}),
          ),
        ),
      );
      expect(find.byType(CreateTripButton), findsOneWidget);
    });

    testWidgets('CreateTripButton has icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CreateTripButton(onPressed: () {}),
          ),
        ),
      );
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('CreateTripButton has text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CreateTripButton(onPressed: () {}),
          ),
        ),
      );
      expect(find.text('สร้างทริป'), findsOneWidget);
    });

    testWidgets('CreateTripButton tap works', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CreateTripButton(
              onPressed: () { tapped = true; },
            ),
          ),
        ),
      );
      await tester.tap(find.byType(InkWell));
      expect(tapped, true);
    });

    testWidgets('CreateTripButton has Material styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CreateTripButton(onPressed: () {}),
          ),
        ),
      );
      expect(find.byType(Material), findsWidgets);
      expect(find.byType(InkWell), findsOneWidget);
    });
  });

  group('HomeScreen View Widget Tests', () {
    testWidgets('HomeScreen.buildTabBarView renders content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeScreen().buildTabBarView(),
          ),
        ),
      );
      expect(find.text('Travel Together'), findsOneWidget);
    });

    testWidgets('HomeScreen view displays subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeScreen().buildTabBarView(),
          ),
        ),
      );
      expect(find.text('ค้นหาเพื่อนร่วมเดินทาง สร้างประสบการณ์ใหม่ๆ ไปด้วยกัน'),
          findsOneWidget);
    });

    testWidgets('HomeScreen view has CreateTripButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeScreen().buildTabBarView(),
          ),
        ),
      );
      expect(find.byType(CreateTripButton), findsOneWidget);
    });

    testWidgets('HomeScreen view layout structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: HomeScreen().buildTabBarView(),
          ),
        ),
      );
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsWidgets); // Multiple rows expected
      expect(find.byType(Expanded), findsOneWidget);
    });
  });
}
