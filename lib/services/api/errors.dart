
class WeatherAPIException implements Exception {
  final String defaultMessage;
  WeatherAPIException([this.defaultMessage = "An unknown issue occurred. Please try again later."]);

  @override
  String toString() => "WeatherException: $defaultMessage";
}

class CityNotFoundException extends WeatherAPIException {
  CityNotFoundException([super.defaultMessage = "City not found. Please check your spelling and try again."]);
}

class NetworkException extends WeatherAPIException {
  NetworkException([super.defaultMessage = "Network error. Please check your connection and try again."]);
}

class InvalidApiKeyException extends WeatherAPIException {
  final String errorMessage;
  InvalidApiKeyException([this.errorMessage = ""]) : super("Unusual... The API key is invalid or missing. Please contact support and provide the following error message: $errorMessage");
}

class WeatherDataFormatException extends WeatherAPIException {
  WeatherDataFormatException([super.defaultMessage = "Received invalid weather data."]);
}

class RateLimitExceededException extends WeatherAPIException {
  RateLimitExceededException([super.defaultMessage = "It seems like you have reached the rate limit. Update your subscription plan and try again!"]);
}

class OpenWeatherAPIException extends WeatherAPIException {
  OpenWeatherAPIException([super.defaultMessage = "Our third party API is currently unavailable. Come back later!"]);
}

class WeatherApiInitializationException extends WeatherAPIException {
  WeatherApiInitializationException([
    super.defaultMessage =
        "Failed to initialize weather service. Please check your API configuration.",
  ]);
}
