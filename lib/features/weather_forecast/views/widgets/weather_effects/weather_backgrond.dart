import 'package:flutter/material.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_background_config.dart';
import 'package:moist_crumb/features/weather_forecast/views/widgets/weather_effects/weather_effects.dart';

/// Animated weather background widget
class WeatherBackground extends StatelessWidget {
  final int? weatherCode;
  final Widget child;
  final WeatherEffectFactory? effectFactory;

  const WeatherBackground({
    super.key,
    this.weatherCode,
    required this.child,
    this.effectFactory,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final config = WeatherBackgroundConfig.fromWeatherCode(
      weatherCode: weatherCode,
      isDarkMode: isDark,
    );

    final colors = config.gradientColorValues
        .map((colorValue) => Color(colorValue))
        .toList();

    final factory = effectFactory ?? const WeatherEffectFactory();
    final effects = factory.createEffects(config.effectTypes);

    return Stack(
      children: [
        AnimatedGradientBackground(colors: colors),
        ...effects,
        child,
      ],
    );
  }
}


// Animated gradient background
class AnimatedGradientBackground extends StatefulWidget {
  final List<Color> colors;

  const AnimatedGradientBackground({
    super.key,
    required this.colors,
  });

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Color>? _previousColors;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _previousColors = widget.colors;
  }

  @override
  void didUpdateWidget(AnimatedGradientBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.colors != widget.colors) {
      _previousColors = oldWidget.colors;
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: _controller.isAnimating && _previousColors != null
                  ? [
                      Color.lerp(_previousColors![0], widget.colors[0],
                          _controller.value)!,
                      Color.lerp(_previousColors![1], widget.colors[1],
                          _controller.value)!,
                    ]
                  : widget.colors,
            ),
          ),
        );
      },
    );
  }
}
