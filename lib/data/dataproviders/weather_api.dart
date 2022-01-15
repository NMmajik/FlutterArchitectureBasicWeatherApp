import 'package:flutter_wheather_bloc_basic/data/services/networking.dart';
import 'package:http/http.dart' as http;

const apiKey = '7005833cf49580aba8f18ea1a0fd099b';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherAPI {
  static Future getRawWeather(String cityName) async {
    print('getRawWeather location: $cityName');
    String url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    return NetworkHelper.getData(url);
  }

  static Future getRawWeatherLL(
      {required String longtitude, required String latitude}) async {
    String url =
        '$openWeatherMapURL?lat=${latitude}&lon=${longtitude}&appid=$apiKey&units=metric';
    print('link: $url');
    return NetworkHelper.getData(url);
  }
}
