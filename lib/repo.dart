import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_application/model/weather_models.dart';

// class Repo {
Future getWeather() async {
  WeatherModel? weather;
  // String city = "Udaipur";
  var weatherApiUrl =
      "https://api.openweathermap.org/data/2.5/weather?q=Mumbai&APPID=43ea6baaad7663dc17637e22ee6f78f2";

  final response = await http.get(Uri.parse(weatherApiUrl));
  log(response.body);

  if (response.statusCode == 200) {
    weather = WeatherModel.fromJson(json.decode(response.body));
    // log(response.body);
  } else {
    log(Exception as String);
  }
  return weather;
}
// }
