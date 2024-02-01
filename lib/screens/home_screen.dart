import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/model/weather_models.dart';
import 'package:weather_application/utils/repo.dart';
import 'package:weather_application/utils/textstyle.dart';

class ApiScreens extends StatefulWidget {
  const ApiScreens({Key? key}) : super(key: key);

  @override
  State<ApiScreens> createState() => _ApiScreensState();
}

class _ApiScreensState extends State<ApiScreens> {
  TextEditingController textEditingController = TextEditingController();
  WeatherModel? weatherModel;

  String formattedTime = DateFormat('hh:mm a', 'en_US').format(DateTime.now());
  String formattedDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String formattedDay = DateFormat('EEEE').format(DateTime.now());

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage(
            'assets/images/sun-removebg-preview.png',
          ),
        ),
        title: const Text(
          "Weather",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border:
                      const OutlineInputBorder(borderRadius: BorderRadius.zero),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  suffixIcon: TextButton(
                    onPressed: () async {
                      weatherModel =
                          await Repo().getWeather(textEditingController.text);
                      setState(() {});
                    },
                    child: const Text("Search"),
                  ),
                  hintText: "Enter city name",
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherModel?.sys?.country ?? "India",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "  :  ${weatherModel?.name ?? "New Delhi"}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                formattedTime,
                style: const TextStyle(
                  fontSize: 29,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$formattedDay  ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 150,
                width: 200,
                child: Image.asset(
                  weatherModel?.main?.temp != null
                      ? weatherModel!.main!.temp! >= 20
                          ? 'assets/images/sun-removebg-preview.png'
                          : weatherModel!.main!.temp! < 16
                              ? 'assets/images/cloud-removebg-preview.png'
                              : weatherModel!.main!.temp! < 14
                                  ? 'assets/images/sun-removebg-preview.png'
                                  : "assets/images/sun-removebg-preview.png"
                      : "assets/images/cloud-removebg-preview.png",
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "${weatherModel?.main?.temp!.toString().substring(0, 2) ?? "0"}\u00B0 C",
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.72,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Max: ${weatherModel?.main?.tempMax!.toString().substring(0, 2) ?? "0"}\u00B0 C",
                          style: textStyle,
                        ),
                        Text(
                          "Min: ${weatherModel?.main?.tempMin!.toString().substring(0, 2) ?? "0"}\u00B0 C",
                          style: textStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Wind: ${weatherModel?.wind!.deg.toString().substring(0, 2) ?? "0"} m/s",
                          style: textStyle,
                        ),
                        Text(
                          "Humidity: ${weatherModel?.main?.humidity!.toString().substring(0, 2) ?? "0"}%",
                          style: textStyle,
                        ),
                      ],
                    ),
                    Text(
                      weatherModel?.weather![0].description ?? "Sky",
                      style: clearSky,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
