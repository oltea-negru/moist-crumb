import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast/condition_badge.dart';

void main() {
  group('ConditionBadge', () {
    testWidgets('displays capitalized condition text', (tester) async {
      const condition = 'clear sky';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ConditionBadge(condition: condition),
          ),
        ),
      );

      expect(find.text('Clear sky'), findsOneWidget);
    }); 

    testWidgets('handles empty condition gracefully', (tester) async {
      const condition = '';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ConditionBadge(condition: condition),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget);
    });
  });
}
