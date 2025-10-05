import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moist_crumb/services/api/errors.dart';
import 'package:moist_crumb/utils/responsive.dart';

class ForecastErrorCard extends StatelessWidget {
  final WeatherAPIException error;
  final VoidCallback? onRetry;
  final String city;

  const ForecastErrorCard({
    super.key,
    required this.error,
    this.onRetry,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.insetsAll(context, 24),
      child: Column(
        spacing: Responsive.scale(context, 24),
        children: [
          ErrorIcon(key: ValueKey(error.runtimeType), error: error),
          ErrorMessage(
            key: ValueKey(ErrorTitleMapper.titleForError(error, city)),
            error: error,
            city: city,
          ),
          if (onRetry != null) ...[RetryButton(onRetry: onRetry!)],
        ],
      ),
    );
  }
}

class ErrorIcon extends StatelessWidget {
  final WeatherAPIException error;

  const ErrorIcon({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: Responsive.insetsAll(context, 8),
      child: Padding(
        padding: Responsive.insetsAll(context, 20),
        child: SvgPicture.asset(
          ErrorAssetMapper.assetForError(error),
          height: Responsive.vs(context, 100),
          colorFilter: ColorFilter.mode(
            theme.colorScheme.error,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final WeatherAPIException error;
  final String city;
  const ErrorMessage({super.key, required this.error, required this.city});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: Responsive.insetsSymmetric(
        context,
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Responsive.radius(context, 14)),
        color: theme.colorScheme.secondaryContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Responsive.scale(context, 16),
        children: [
          Text(
            ErrorTitleMapper.titleForError(error, city),
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            error.defaultMessage,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
      
    );
  }
}

class RetryButton extends StatelessWidget {
  final VoidCallback onRetry;

  const RetryButton({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onRetry,
      icon: const Icon(Icons.refresh_rounded, size: 20),
      label: const Text('Try Again'),
    );
  }
}

class ErrorTitleMapper {
  static String titleForError(WeatherAPIException e, String city) {
    return switch (e) {
      CityNotFoundException() => 'Location Not Found: "$city"',
      NetworkException() => 'Connection Issue',
      RateLimitExceededException() => 'Too Many Requests',
      InvalidApiKeyException() => 'Configuration Error',
      OpenWeatherAPIException() => 'Service Unavailable',
      WeatherDataFormatException() => 'Data Error',
      WeatherApiInitializationException() => 'Initialization Failed',
      _ => 'Something Went Wrong',
    };
  }
}

class ErrorAssetMapper {
  static String assetForError(WeatherAPIException e) {
    return switch (e) {
      CityNotFoundException() => 'assets/svgs/not-found-error.svg',
      NetworkException() => 'assets/svgs/network-error.svg',
      RateLimitExceededException() => 'assets/svgs/rate-limit-error.svg',
      InvalidApiKeyException() => 'assets/svgs/general-error.svg',
      OpenWeatherAPIException() => 'assets/svgs/general-error.svg',
      WeatherDataFormatException() => 'assets/svgs/general-error.svg',
      WeatherApiInitializationException() => 'assets/svgs/general-error.svg',
      _ => 'assets/svgs/general-error.svg',
    };
  }
}
