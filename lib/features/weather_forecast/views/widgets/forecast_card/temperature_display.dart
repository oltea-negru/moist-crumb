import 'package:flutter/material.dart';

class TemperatureDisplay extends StatelessWidget {
  final int temperature;
  final double fontSize;

  const TemperatureDisplay({
    super.key,
    required this.temperature,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      '${temperature.toString()}°',
      style: theme.textTheme.headlineLarge?.copyWith(
        fontSize: fontSize,
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}
