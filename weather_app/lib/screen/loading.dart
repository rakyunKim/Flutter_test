import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screen/weather_screen.dart';

const String apiKey = "9bb651c3ad76581d350fb240597fda38";

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    double? myLatitude2;
    double? myLongitude2;
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
    myLatitude2 = myLocation.myLatitude;
    myLongitude2 = myLocation.myLongitude;
    NetWork network = NetWork(
      "https://api.openweathermap.org/data/2.5/weather?lat=$myLatitude2&lon=$myLongitude2&appid=$apiKey&units=metric",
    );
    var weatherData = await network.getJsonData();
    print(weatherData);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(parseWeatherData: weatherData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80,
        ),
        // child: FilledButton(
        //   onPressed: () {
        //     getLocation();
        //   },
        //   child: const Text('Get location'),
        // ),
      ),
    );
  }
}
