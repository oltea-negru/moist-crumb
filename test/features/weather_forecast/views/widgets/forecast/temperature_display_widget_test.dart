import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast_card/temperature_display.dart';

void main() {
  group('TemperatureDisplay', () {
    testWidgets('displays temperature with correct text and style', (tester) async {
      const temperature = 25;
      const fontSize = 50.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TemperatureDisplay(
              temperature: temperature,
              fontSize: fontSize,
            ),
          ),
        ),
      );

      expect(find.text('25'), findsOneWidget);
      
      final textWidget = tester.widget<Text>(find.text('25'));
      expect(textWidget.style?.fontSize, fontSize);
    });
  });
}
