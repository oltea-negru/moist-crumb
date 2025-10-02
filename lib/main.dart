import 'package:flutter/material.dart';
import 'package:moist_crumb/constants/theme/colors.dart';
import 'package:moist_crumb/features/homepage/views/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moist Crumb',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seedColor),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
