import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/utils/api_adapter.dart';
import 'package:myapp/utils/constants.dart';
import '../models/weather_model.dart';

class WeatherApiService {
  Future<WeatherModel?> getWeather(String cityName) async {
    try {
      ApiAdapter apiAdapter = ApiAdapter();
      final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKEY&units=metric';
      final responseData = await apiAdapter.get(url);
      return WeatherModel.fromJson(responseData);
    } catch (err) {
      Fluttertoast.showToast(
        msg: err.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    }
  }
}
