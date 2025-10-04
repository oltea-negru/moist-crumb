import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForecastErrorCard extends StatelessWidget {
  final String errorMessage;
  final double width;
  const ForecastErrorCard({super.key, required this.errorMessage, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        boxShadow: [
          BoxShadow(color: Colors.white.withValues(alpha: 0.8), blurRadius: 30),
        ],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color.fromARGB(255, 237, 241, 250),
          width: 1,
        ),
      ),
      width: width,
      child: Column(
        children: [       
          SvgPicture.asset('assets/svgs/error.svg'),
          Text(errorMessage, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}