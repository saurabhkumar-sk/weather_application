import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:weather_application/model/weather_models.dart';
import 'package:weather_application/repo.dart';

class ApiScreens extends StatefulWidget {
  const ApiScreens({Key? key}) : super(key: key);

  @override
  State<ApiScreens> createState() => _ApiScreensState();
}

class _ApiScreensState extends State<ApiScreens> {
  TextEditingController textEditingController = TextEditingController();
  // Map<String, dynamic> finalResponse = {};
  // Future<void> apicall() async {
  //   String city = "Bihar";
  //   var weatherApiUrl =
  //       "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2";

  //   http.Response response;
  //   response = await http.get(
  //     Uri.parse(weatherApiUrl),
  //   );
  //   // log(response.body);
  //   if (response.statusCode == 200) {
  //     try {
  //       setState(() {
  //         finalResponse = json.decode(response.body);
  //       });
  //     } catch (e) {
  //       log('Error decoding JSON:  : $e');
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: const Text(
          "Api Screen",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
            ),
            ElevatedButton(
              onPressed: () async {
                WeatherModel a =
                    await Repo().getWeather(textEditingController.text);
                log(a.main!.temp.toString(), name: 'weather');
              },
              child: const Text("Search"),
            ),
            // Text(a.main!.temp).toString();
          ],
        ),
      ),
    );
  }
}
