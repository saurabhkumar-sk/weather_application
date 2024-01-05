import 'package:flutter/material.dart';
import 'package:weather_application/model/weather_models.dart';
import 'package:weather_application/repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ignore: unused_field
  WeatherModel? _weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getWeather(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text(
                _weather?.description ?? "saurabh ",
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
