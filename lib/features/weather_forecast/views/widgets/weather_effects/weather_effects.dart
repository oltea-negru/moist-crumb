import 'package:flutter/material.dart';
import 'package:moist_crumb/features/weather_forecast/models/weather_background_config.dart';
import 'package:moist_crumb/utils/responsive.dart';
import 'dart:math' as math;


class WeatherEffectFactory {
  const WeatherEffectFactory();

  List<Widget> createEffects(List<WeatherEffectType> types) {
    return types.map(_createEffect).toList();
  }

  Widget _createEffect(WeatherEffectType type) {
    switch (type) {
      case WeatherEffectType.thunderstorm:
        return const RainEffect(intensity: RainIntensity.heavy, addLightning: true);
      case WeatherEffectType.drizzle:
        return const RainEffect(intensity: RainIntensity.light);
      case WeatherEffectType.rain:
        return const RainEffect(intensity: RainIntensity.heavy);
      case WeatherEffectType.atmosphere:
        return const FogEffect();
      case WeatherEffectType.clear:
        return const SunRaysEffect();
      case WeatherEffectType.clouds:
        return const CloudEffect();
      case WeatherEffectType.snow:
        return const SnowEffect();

    }
  }
}

enum RainIntensity { light, heavy }

class RainEffect extends StatelessWidget {
  final RainIntensity intensity;
  final bool addLightning;
  
  const RainEffect({
    super.key,
    this.intensity = RainIntensity.heavy,
    this.addLightning = false,
  });

  @override
  Widget build(BuildContext context) {
    // The amount of rain drops on the screen
    final count = intensity == RainIntensity.light ? 20 : 200;
    
    return IgnorePointer(
      child: RepaintBoundary(
        child: Stack(
          children: [
            ...List.generate(count, (index) {
              return RainDrop(
                key: ValueKey('rain_$index'),
                delay: Duration(milliseconds: index * 100),
              );
            }),
            if (addLightning) const RainLightningEffect(),
          ],
        ),
      ),
    );
  }
}

class RainDrop extends StatefulWidget {
  final Duration delay;
  const RainDrop({super.key, required this.delay});

  @override
  State<RainDrop> createState() => _RainDropState();
}

class _RainDropState extends State<RainDrop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double leftPosition;
  late double speed;

  @override
  void initState() {
    super.initState();
    final random = math.Random();
    leftPosition = random.nextDouble() * 100;
    speed = 0.8 + random.nextDouble() * 0.4;
    
    _controller = AnimationController(
      duration: Duration(milliseconds: (1200 / speed).round()),
      vsync: this,
    );
    
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat();
      }
    });
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
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final yPos = _controller.value;
        
        return Positioned(
          left: (screenWidth * (leftPosition / 100)).clamp(0.0, screenWidth - 5),
          top: -20 + (screenHeight + 40) * yPos,
          child: Container(
            width: Responsive.hs(context, 2),
            height: Responsive.vs(context, 25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0.0),
                  Colors.white.withValues(alpha: 0.8),
                  Colors.white.withValues(alpha: 0.0),
                ],
              ),
              borderRadius: BorderRadius.circular(
                Responsive.radius(context, 1),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RainLightningEffect extends StatefulWidget {
  const RainLightningEffect({super.key});

  @override
  State<RainLightningEffect> createState() => _RainLightningEffectState();
}

class _RainLightningEffectState extends State<RainLightningEffect> {
  bool _showLightning = false;
  int? _lightningSeed;
  
  @override
  void initState() {
    super.initState();
    // Initial delay before first lightning (0.5-3.5 seconds)
    final random = math.Random();
    final initialDelay = Duration(milliseconds: 500 + random.nextInt(3000));
    Future.delayed(initialDelay, () {
      if (mounted) {
        _scheduleLightning();
      }
    });
  }

  void _scheduleLightning() {
    if (!mounted) return;
    
    final random = math.Random();
    // Random delay between 1-3 seconds for more frequent lightning
    final delay = Duration(milliseconds: 1000 + random.nextInt(2000));
    
    Future.delayed(delay, () {
      if (mounted) {
        setState(() {
          _showLightning = true;
          _lightningSeed = random.nextInt(1 << 31);
        });
        
        // How long the lightning will be visible
        Future.delayed(const Duration(milliseconds: 150), () {
          if (mounted) {
            setState(() => _showLightning = false);
            _scheduleLightning();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: RepaintBoundary(
        child: Stack(
          children: [
            Opacity(
              opacity: (_showLightning && _lightningSeed != null) ? 1.0 : 0.0,
              child: CustomPaint(
                size: MediaQuery.of(context).size,
                painter: RainLightningPainter(seed: _lightningSeed ?? 0),
              ),
            ),
            AnimatedOpacity(
              opacity: _showLightning ? 0.35 : 0.0,
              duration: const Duration(milliseconds: 150),
              child: const SizedBox.expand(
                child: ColoredBox(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RainLightningPainter extends CustomPainter {
  final int seed;

  RainLightningPainter({required this.seed});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(seed);
    final boltCount = 1 + random.nextInt(2);

    for (int b = 0; b < boltCount; b++) {
      final startX = size.width * (0.6 + random.nextDouble() * 0.35);
      final startY = size.height * (0.0 + random.nextDouble() * 0.25);
      final endX = startX - (40 + random.nextDouble() * 100);
      final endY = size.height * (0.4 + random.nextDouble() * 0.4);

      final points = _generateBoltPoints(
        Offset(startX, startY),
        Offset(endX, endY),
        random,
      );

      _drawBolt(canvas, points);
    }
  }

  List<Offset> _generateBoltPoints(
      Offset start, Offset end, math.Random random) {
    final int segments = 8 + random.nextInt(6);
    final dx = (end.dx - start.dx) / segments;
    final dy = (end.dy - start.dy) / segments;

    final List<Offset> points = [start];
    for (int i = 1; i < segments; i++) {
      final baseX = start.dx + dx * i;
      final baseY = start.dy + dy * i;
      final jitterX = (random.nextDouble() - 0.5) * 25;
      final jitterY = (random.nextDouble() - 0.5) * 12;
      points.add(Offset(baseX + jitterX, baseY + jitterY));
    }
    points.add(end);
    return points;
  }

  void _drawBolt(Canvas canvas, List<Offset> points) {
    final glowPaintOuter = Paint()
      ..color = Colors.blueAccent.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final glowPaintInner = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

    final corePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(path, glowPaintOuter);
    canvas.drawPath(path, glowPaintInner);
    canvas.drawPath(path, corePaint);

    // Small side branches
    for (int i = 2; i < points.length - 2; i += 2) {
      final base = points[i];
      final branchEnd = Offset(
        base.dx - 20 + (i % 3 == 0 ? -10 : 10),
        base.dy + 10,
      );
      final branch = Path()
        ..moveTo(base.dx, base.dy)
        ..lineTo(branchEnd.dx, branchEnd.dy);
      canvas.drawPath(branch, glowPaintInner);
      canvas.drawPath(branch, corePaint);
    }
  }

  @override
  bool shouldRepaint(RainLightningPainter oldDelegate) => seed != oldDelegate.seed;
}

class SnowEffect extends StatelessWidget {
  const SnowEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: List.generate(40, (index) {
          return Snowflake(
            key: ValueKey('snow_$index'),
            delay: Duration(milliseconds: index * 100),
          );
        }),
      ),
    );
  }
}

class Snowflake extends StatefulWidget {
  final Duration delay;

  const Snowflake({super.key, required this.delay});

  @override
  State<Snowflake> createState() => _SnowflakeState();
}

class _SnowflakeState extends State<Snowflake>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double leftPosition;
  late double size;
  late double drift;

  @override
  void initState() {
    super.initState();
    final random = math.Random();
    leftPosition = random.nextDouble() * 100;
    size = 3 + random.nextDouble() * 5;
    drift = random.nextDouble() * 40 - 20;

    _controller = AnimationController(
      duration: Duration(milliseconds: 4000 + random.nextInt(2000)),
      vsync: this,
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat();
      }
    });
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
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final wave = math.sin(_controller.value * 2 * math.pi * 2);

        return Positioned(
          left: (screenWidth * (leftPosition / 100)) + (wave * drift),
          top: screenHeight * _controller.value,
          child: Container(
            width: Responsive.scale(context, size),
            height: Responsive.scale(context, size),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CloudEffect extends StatelessWidget {
  final Color color;

  const CloudEffect({
    super.key,
    this.color = const Color(0x60FFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenH = constraints.maxHeight;
          return Stack(
            children: List.generate(8, (index) {
              final random = math.Random(index * 9973);
              final y = (0.05 + random.nextDouble() * 0.8).clamp(0.05, 0.85);
              final width = 120.0 + random.nextDouble() * 140.0; // 120..260
              final height = width * (0.45 + random.nextDouble() * 0.2); // aspect 0.45..0.65
              final opacity = 0.25 + random.nextDouble() * 0.35; // 0.25..0.60
              final durationSec = 28 + random.nextInt(36); // 28..63s
              // Faster startup and pre-spread across screen
              final delayMs = random.nextInt(1500); // 0..1.5s
              final initialProgress = random.nextDouble(); // 0..1
              final fromLeft = random.nextBool();

              return MovingCloud(
                key: ValueKey('cloud_$index'),
                delay: Duration(milliseconds: delayMs),
                yPosition: (screenH * y) / screenH,
                color: color,
                cloudWidth: width,
                cloudHeight: height,
                opacity: opacity,
                duration: Duration(seconds: durationSec),
                initialProgress: initialProgress,
                fromLeft: fromLeft,
              );
            }),
          );
        },
      ),
    );
  }
}

class MovingCloud extends StatefulWidget {
  final Duration delay;
  final double yPosition;
  final Color color;
  final double cloudWidth;
  final double cloudHeight;
  final double opacity;
  final Duration duration;
  final double initialProgress; // 0..1, to spread clouds initially
  final bool fromLeft; // direction: true -> left to right, false -> right to left

  const MovingCloud({
    super.key,
    required this.delay,
    required this.yPosition,
    required this.color,
    required this.cloudWidth,
    required this.cloudHeight,
    required this.opacity,
    required this.duration,
    required this.initialProgress,
    required this.fromLeft,
  });

  @override
  State<MovingCloud> createState() => _MovingCloudState();
}

class _MovingCloudState extends State<MovingCloud>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Pre-spread: set a random initial progress before starting
    _controller.value = widget.initialProgress.clamp(0.0, 1.0);

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat();
      }
    });
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
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        // Compute horizontal position based on direction and progress
        final progress = _controller.value;
        final left = widget.fromLeft
            ? (screenWidth * progress) - (widget.cloudWidth * 0.8)
            : (screenWidth * (1.0 - progress)) - (widget.cloudWidth * 0.2);

        return Positioned(
          left: left,
          top: screenHeight * widget.yPosition,
          child: Opacity(
            opacity: widget.opacity,
            child: CustomPaint(
              size: Size(widget.cloudWidth, widget.cloudHeight),
              painter: CloudPainter(color: widget.color),
            ),
          ),
        );
      },
    );
  }
}

class CloudPainter extends CustomPainter {
  final Color color;

  CloudPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw cloud shape with multiple circles
    canvas.drawCircle(Offset(size.width * 0.28, size.height * 0.55), size.height * 0.38, paint);
    canvas.drawCircle(Offset(size.width * 0.48, size.height * 0.45), size.height * 0.48, paint);
    canvas.drawCircle(Offset(size.width * 0.68, size.height * 0.55), size.height * 0.42, paint);
    // Optional small puffs for irregularity
    canvas.drawCircle(Offset(size.width * 0.40, size.height * 0.62), size.height * 0.22, paint);
    canvas.drawCircle(Offset(size.width * 0.58, size.height * 0.62), size.height * 0.20, paint);
  }

  @override
  bool shouldRepaint(CloudPainter oldDelegate) => color != oldDelegate.color;
}

class SunRaysEffect extends StatefulWidget {
  final double intensity;

  const SunRaysEffect({
    super.key,
    this.intensity = 0.4,
  });

  @override
  State<SunRaysEffect> createState() => _SunRaysEffectState();
}

class _SunRaysEffectState extends State<SunRaysEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: MediaQuery.of(context).size,
            painter: SunRaysPainter(
              rotation: _controller.value * 2 * math.pi,
              intensity: widget.intensity,
              isLightTheme: Theme.of(context).brightness == Brightness.light,
            ),
          );
        },
      ),
    );
  }
}

class SunRaysPainter extends CustomPainter {
  final double rotation;
  final double intensity;
  final bool isLightTheme;

  SunRaysPainter({required this.rotation, required this.intensity, required this.isLightTheme});

  @override
  void paint(Canvas canvas, Size size) {
    final rightCenter = Offset(size.width + 80, size.height * 0.35);

    final double baseOpacity = isLightTheme
        ? (intensity * 1.1).clamp(0.6, 1.0).toDouble()
        : (intensity * 0.9).clamp(0.45, 0.95).toDouble();
    final rayColor = (isLightTheme ? Colors.amberAccent : Colors.yellowAccent)
        .withValues(alpha: baseOpacity);

    final rayPaint = Paint()
      ..color = rayColor
      ..blendMode = BlendMode.plus;

    // Subtle sway using rotation value (don't spin fully)
    final sway = math.sin(rotation) * 0.12;
    // Gentle continuous rotation of the ray fan
    final baseRotation = rotation * 0.15;

    void drawFan(Offset center, {required bool pointInward}) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(sway + baseRotation);

      const rayCount = 21;
      const startAngle = -math.pi * 0.5; // -90°
      const endAngle = math.pi * 0.5;    // +90°
      for (int i = 0; i < rayCount; i++) {
        // Render moderately sparse: draw every 2nd ray
        if (i % 2 != 0) {
          continue;
        }
        final t = rayCount == 1 ? 0.0 : i / (rayCount - 1);
        final angle = startAngle + (endAngle - startAngle) * t;

        canvas.save();
        canvas.rotate(angle);

        final Path path;
        if (pointInward) {
          // Right side: triangles pointing leftwards
          path = Path()
            ..moveTo(-360, 0)
            ..lineTo(-150, -22)
            ..lineTo(-150, 22)
            ..close();
        } else {
          // Left side: triangles pointing rightwards
          path = Path()
            ..moveTo(360, 0)
            ..lineTo(150, 22)
            ..lineTo(150, -22)
            ..close();
        }

        canvas.drawPath(path, rayPaint);
        canvas.restore();
      }

      canvas.restore();
    }

    // Draw only from the right side
    drawFan(rightCenter, pointInward: true);
  }

  @override
  bool shouldRepaint(SunRaysPainter oldDelegate) =>
      rotation != oldDelegate.rotation ||
      intensity != oldDelegate.intensity ||
      isLightTheme != oldDelegate.isLightTheme;
}

// Thunderstorm-specific lightning effect and painter removed in favor of
// the shared RainLightningEffect/RainLightningPainter used by the factory.

class FogEffect extends StatefulWidget {
  const FogEffect({super.key});

  @override
  State<FogEffect> createState() => _FogEffectState();
}

class _FogEffectState extends State<FogEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0.3 * _controller.value),
                  Colors.white.withValues(alpha: 0.5 * (1 - _controller.value)),
                  Colors.white.withValues(alpha: 0.3 * _controller.value),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}