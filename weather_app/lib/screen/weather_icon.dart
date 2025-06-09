import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherIcon {
  Widget? getWeatherIcon(int condition){
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/cloud_lightning.svg',
        colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/cloud_rain.svg',
        colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
      );
    } else if (condition < 700) {
      return SvgPicture.asset(
        'svg/cloud_snow_alt.svg',
        colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/sun.svg',
        colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/cloud_sun.svg',
        colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
      );
    }
    return null;
  }
}