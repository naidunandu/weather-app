import 'package:flutter/material.dart';

Color getBackgroundColor(String weatherMain) {
  switch (weatherMain) {
    case 'Clear':
      return Colors.blueAccent;
    case 'Clouds':
      return Colors.grey.shade400;
    case 'Rain':
      return Colors.indigo;
    case 'Drizzle':
      return Colors.lightBlueAccent;
    case 'Thunderstorm':
      return Colors.deepPurple;
    case 'Snow':
      return Colors.lightBlue;
    case 'Mist':
      return Colors.blueGrey.shade400;
    case 'Smoke':
      return Colors.brown;
    case 'Haze':
      return Colors.blueGrey;
    case 'Dust':
      return Colors.orangeAccent;
    case 'Fog':
      return Colors.blueGrey;
    case 'Sand':
      return Colors.orange;
    case 'Ash':
      return Colors.grey;
    case 'Squall':
      return Colors.teal;
    case 'Tornado':
      return Colors.deepOrange;
    default:
      return Colors.blueGrey;
  }
}


IconData getWeatherIcon(String weatherMain) {
  switch (weatherMain) {
    case 'Clear':
      return Icons.wb_sunny;
    case 'Clouds':
      return Icons.cloud;
    case 'Rain':
      return Icons.grain;
    case 'Drizzle':
      return Icons.grain;
    case 'Thunderstorm':
      return Icons.flash_on;
    case 'Snow':
      return Icons.ac_unit;
    case 'Mist':
      return Icons.blur_on;
    case 'Smoke':
      return Icons.smoke_free;
    case 'Haze':
      return Icons.blur_on;
    case 'Dust':
      return Icons.waves;
    case 'Fog':
      return Icons.blur_on;
    case 'Sand':
      return Icons.waves;
    case 'Ash':
      return Icons.whatshot;
    case 'Squall':
      return Icons.air;
    case 'Tornado':
      return Icons.toys;
    default:
      return Icons.help_outline;
  }
}

Color getContrastTextColor(Color backgroundColor) {
  double luminance = backgroundColor.computeLuminance();
  return luminance > 0.5 ? Colors.black : Colors.white;
}