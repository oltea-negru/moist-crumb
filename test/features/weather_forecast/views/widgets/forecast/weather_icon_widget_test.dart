import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/forecast_card/weather_icon.dart';

void main() {
  group('WeatherIcon', () {
    testWidgets('displays weather icon with correct height', (tester) async {
      const iconUrl = 'https://example.com/icon.png';
      const height = 100.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherIcon(
              iconUrl: iconUrl,
              height: height,
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.height, height);
      expect(image.image, isA<NetworkImage>());
    });

    testWidgets('shows error icon when network image fails', (tester) async {
      const iconUrl = 'https://invalid-url.com/icon.png';
      const height = 100.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherIcon(
              iconUrl: iconUrl,
              height: height,
              enableAnimation: false, // Disable animation to avoid timeout
            ),
          ),
        ),
      );

      // Wait for network image to fail without animation
      await tester.pump(const Duration(seconds: 1));

      expect(find.byIcon(Icons.wb_sunny), findsOneWidget);
    });

    testWidgets('displays weather icon without animation when disabled', (tester) async {
      const iconUrl = 'https://example.com/icon.png';
      const height = 100.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherIcon(
              iconUrl: iconUrl,
              height: height,
              enableAnimation: false,
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.height, height);
      expect(image.image, isA<NetworkImage>());
    });

    testWidgets('uses custom animation parameters', (tester) async {
      const iconUrl = 'https://example.com/icon.png';
      const height = 100.0;
      const customDuration = Duration(seconds: 1);
      const customRange = 10.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherIcon(
              iconUrl: iconUrl,
              height: height,
              animationDuration: customDuration,
              animationRange: customRange,
            ),
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));
      expect(image.height, height);
      expect(image.image, isA<NetworkImage>());
    });
  });
}
