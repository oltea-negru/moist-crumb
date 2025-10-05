import 'package:flutter/material.dart';

class LocationSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  const LocationSearchBar({super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SearchBar(
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.all(
        theme.colorScheme.surfaceContainer,
      ),
      hintText: 'Search for a city',
      controller: controller,
      onSubmitted: onSubmitted,
      trailing: const [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.location_on),
        ),
      ],
      
    );
  }
}