import 'package:bloc_pattern_weather_app/model/weather_model.dart';
import 'dart:async';
import 'bloc_provider.dart';

class Repository {
  final weatherProvider = WeatherProvider();

  Future<WeatherModel> fetchWeather() => weatherProvider.fetchData();
}
