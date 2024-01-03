class WeatherModel {
  final double temp;
  final double feelsLike;
  final double tempmin;
  final double tempmax;
  final String description;
  final int humidity;
  final int pressure;
  final double speed;
  final String name;

  WeatherModel({
    required this.temp,
    required this.feelsLike,
    required this.tempmin,
    required this.tempmax,
    required this.description,
    required this.humidity,
    required this.pressure,
    required this.speed,
    required this.name,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      tempmin: json['main']['temp_min'].toDouble(),
      tempmax: json['main']['temp_max'].toDouble(),
      description: json['weatherModel'][0]['description'],
      humidity: json['main']['humidity'].toInt(),
      pressure: json['main']['pressure'].toInt(),
      speed: json['wind']['speed'].toDouble(),
      name: json['name'].toString(),
    );
  }
}
