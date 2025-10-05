import 'package:flutter/material.dart';
import 'package:moist_crumb/utils/responsive.dart';

class ForecastLoadingSkeleton extends StatefulWidget {
  final double width;
  final double height;

  const ForecastLoadingSkeleton({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<ForecastLoadingSkeleton> createState() =>
      _ForecastLoadingSkeletonState();
}

class _ForecastLoadingSkeletonState extends State<ForecastLoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final minHeight = Responsive.vs(context, 120);
    final maxHeight = widget.height * 0.7;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = _controller.value;
        final currentHeight = minHeight + (maxHeight - minHeight) * progress;

        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: currentHeight,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Responsive.radius(context, 14)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  theme.colorScheme.surfaceContainerHigh.withValues(alpha: 0.35),
                  theme.colorScheme.surfaceContainer.withValues(alpha: 0.2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
