import 'package:flutter/material.dart';
import 'package:moist_crumb/extensions/string_extension.dart';

class ConditionBadge extends StatelessWidget {
  final String condition;

  const ConditionBadge({
    super.key,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        condition.capitalizeFirst(),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
