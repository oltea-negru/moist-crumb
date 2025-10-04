import 'package:flutter/material.dart';

class WeatherIcon extends StatefulWidget {
  final String iconUrl;
  final double height;
  final bool enableAnimation;
  final Duration animationDuration;
  final double animationRange;

  const WeatherIcon({
    super.key,
    required this.iconUrl,
    required this.height,
    this.enableAnimation = true,
    this.animationDuration = const Duration(seconds: 2),
    this.animationRange = 5.0,
  });

  @override
  State<WeatherIcon> createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.enableAnimation) {
      _initializeAnimation();
    }
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _floatingAnimation = Tween<double>(
      begin: -widget.animationRange,
      end: widget.animationRange,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    if (widget.enableAnimation) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enableAnimation) {
      return AnimatedBuilder(
        animation: _floatingAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _floatingAnimation.value),
            child: _buildIcon(),
          );
        },
      );
    }
    return _buildIcon();
  }

  Widget _buildIcon() {
    return Image.network(
      widget.iconUrl,
      height: widget.height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.wb_sunny,
          size: widget.height,
          color: Colors.grey,
        );
      },
    );
  }
}
