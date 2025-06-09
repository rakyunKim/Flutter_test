import 'package:flutter/material.dart';
import 'package:weather_app/screen/weather_icon.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;
  const WeatherScreen({super.key, required this.parseWeatherData});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? myTemp;
  Widget? icon;
  WeatherIcon weatherIcon = WeatherIcon();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData['name'];
    double myTemp2 = weatherData['main']['temp'];
    myTemp = myTemp2.round();
    int condition = weatherData['weather'][0]['id'];
    icon = weatherIcon.getWeatherIcon(condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$cityName",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "$myTemp\u2103",
                style: TextStyle(
                  fontSize: 85,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              icon != null ? icon as Widget : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
