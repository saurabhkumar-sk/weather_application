import 'package:http/http.dart' as http;
import 'package:weather_application/model/whearher_models.dart';

class Repo {
  getWheather(String? city) async {
    final wheatherApiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2";

    final res = await http.get(Uri.parse(wheatherApiUrl));

    var resBody = res.body;

    if (res.statusCode == 200) {
    } else {}
  }
}
