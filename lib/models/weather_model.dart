class WeatherModel {
  final String cityName;
  final double temperature;
  final String main;
  final double windSpeed;
  final double humidity;
  final double visibility;
  final String name;

  WeatherModel(
      {required this.cityName, required this.temperature, required this.main, required this.windSpeed, required this.humidity, required this.visibility, required this.name});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: double.tryParse(json['main']['temp'].toString()) ?? 0,
      main: json['weather'][0]['main'],
      visibility: double.tryParse(json["visibility"].toString()) ?? 0,
      windSpeed: double.tryParse(json["wind"]["speed"].toString()) ?? 0,
      name: json["name"],
      humidity: double.tryParse(json["main"]["humidity"].toString()) ?? 0,
    );
  }
}
