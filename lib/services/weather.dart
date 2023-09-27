import 'package:clima/services/location.dart';

import 'key.dart';
import 'networking.dart';

class WeatherModel {
  double? longitude;
  double? latitude;

  Future<dynamic> getCityWeather(String cityName) async {
    const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
    NetworkHelper networkHelper = NetworkHelper(
        Uri.parse('$openWeatherMapUrl?q=$cityName&units=metric&appid=$apiKey'));
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
    Location location = Location();
    await location.getCurrentLocation();

    longitude = location.long;
    latitude = location.lat;

    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        '$openWeatherMapUrl?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey'));

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
