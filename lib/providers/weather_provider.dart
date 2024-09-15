import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_api_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weather;
  bool isLoading = false;

  Future<void> fetchWeather(String cityName) async {
    isLoading = true;
    notifyListeners();
    weather = await WeatherApiService().getWeather(cityName);
    isLoading = false;
    notifyListeners();
  }
}
