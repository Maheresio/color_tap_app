// test/views/home_view_test.dart

import 'package:color_tap_app/views/home_view.dart';
import 'package:color_tap_app/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeView Widget Tests', () {
    testWidgets('HomeView builds with initial colors', (tester) async {
      // Build the HomeView widget
      await tester.pumpWidget(const MaterialApp(home: HomeView()));

      // Expect to find HomeViewBody inside the widget tree
      expect(find.byType(HomeViewBody), findsOneWidget);

      // Find the text
      expect(find.text('Hello There'), findsOneWidget);
    });

    testWidgets('Tapping the screen changes background and text colors', (
      tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomeView()));

      // Find HomeViewBody widget
      final homeViewBodyFinder = find.byType(HomeViewBody);
      expect(homeViewBodyFinder, findsOneWidget);

      // Get initial widget
      final HomeViewBody initialWidget = tester.widget(homeViewBodyFinder);

      final initialBackgroundColor = initialWidget.backgroundColor;
      final initialTextColor = initialWidget.textColor;

      // Tap the widget
      await tester.tap(homeViewBodyFinder);
      await tester.pumpAndSettle(); // Wait for animations to finish

      // Get updated widget
      final HomeViewBody updatedWidget = tester.widget(homeViewBodyFinder);

      // Background and text colors should have changed
      expect(updatedWidget.backgroundColor != initialBackgroundColor, true);
      expect(updatedWidget.textColor != initialTextColor, true);
    });
  });
}
