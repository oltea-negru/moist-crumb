import 'package:flutter/widgets.dart';

/// Responsive sizing helpers for mobile screens.
class Responsive {
  static const double _baselineWidth = 375.0;
  static const double _baselineHeight = 812.0;

  /// Scale value using device shortest side vs baseline width.
  static double scale(BuildContext context, double value) {
    final shortest = MediaQuery.sizeOf(context).shortestSide;
    final factor = (shortest / _baselineWidth).clamp(0.8, 1.25);
    return value * factor;
  }

  /// Horizontal scale based on width.
  static double hs(BuildContext context, double value) {
    final width = MediaQuery.sizeOf(context).width;
    final factor = (width / _baselineWidth).clamp(0.8, 1.3);
    return value * factor;
  }

  /// Vertical scale based on height.
  static double vs(BuildContext context, double value) {
    final height = MediaQuery.sizeOf(context).height;
    final factor = (height / _baselineHeight).clamp(0.8, 1.3);
    return value * factor;
  }

  /// Font size scale
  static double sp(BuildContext context, double value) {
    final shortest = MediaQuery.sizeOf(context).shortestSide;
    final factor = (shortest / _baselineWidth).clamp(0.9, 1.2);
    return value * factor;
  }

  /// Radius scaling.
  static double radius(BuildContext context, double value) => scale(context, value);

  /// EdgeInsets helpers
  static EdgeInsets insetsAll(BuildContext context, double value) =>
      EdgeInsets.all(scale(context, value));

  static EdgeInsets insetsSymmetric(
    BuildContext context, {
    double horizontal = 0,
    double vertical = 0,
  }) => EdgeInsets.symmetric(
        horizontal: hs(context, horizontal),
        vertical: vs(context, vertical),
      );

  static EdgeInsets insetsOnly(
    BuildContext context, {
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
        left: hs(context, left),
        top: vs(context, top),
        right: hs(context, right),
        bottom: vs(context, bottom),
      );
}


