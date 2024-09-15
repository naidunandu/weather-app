import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../utils/helpers.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.width * 5 / 100),
        Center(
          child: Icon(
            getWeatherIcon(weather.main!),
            color: Colors.white,
            size: 100,
          ),
        ),
        Center(
          child: Text(
            "${weather.temperature.toStringAsFixed(1)}°C",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: getContrastTextColor(
                getBackgroundColor(weather.main!),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 18 / 100),
          child: Center(
            child: Text(
              weather.main,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: getContrastTextColor(
                  getBackgroundColor(weather.main!),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            "Daily summary",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: getContrastTextColor(
                getBackgroundColor(weather.main!),
              ),
            ),
          ),
        ),
        Text(
          "Now it feels ${(weather.temperature + 5).toStringAsFixed(0)}°C in ${weather?.name ?? "No name"} , "
          "actually ${weather.temperature.toStringAsFixed(0)}. Today, the temperature is felt in the range from ${(weather.temperature - 7).toStringAsFixed(0)}° "
          "to ${(weather.temperature + 5).toStringAsFixed(0)}°",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: getContrastTextColor(
              getBackgroundColor(weather.main!),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.wind_power_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${weather.windSpeed}km/h",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "wind",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        const Icon(
                          Icons.water_drop_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${weather.humidity}%",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Humidity",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: [
                        const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${weather.visibility}km",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "Visibility",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  // Function to get weather icon based on temperature
}
