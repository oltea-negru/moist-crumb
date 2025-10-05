import 'package:flutter/material.dart';

class LocationSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  const LocationSearchBar({super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: WidgetStateProperty.all(0),
      hintText: 'Search for a city',
      controller: controller,
      onSubmitted: onSubmitted,
      trailing: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on),
        ),
      ],
    );
  }
}