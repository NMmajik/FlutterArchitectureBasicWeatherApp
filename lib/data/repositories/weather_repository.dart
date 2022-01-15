import 'package:flutter_wheather_bloc_basic/data/data_providers/weather_api.dart';
import 'package:flutter_wheather_bloc_basic/data/models/weather.dart';
import 'package:flutter_wheather_bloc_basic/data/services/location.dart';

class WeatherRepository {
  Future<Weather> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    final String rawWeather = await WeatherAPI.getRawWeatherLL(
        longtitude: location.longtitude.toString(),
        latitude: location.latitude.toString());
    return Weather.fromJSON(rawWeather);
  }

  Future<Weather> getWeatherForLocation(String cityName) async {
    final String rawWeather = await WeatherAPI.getRawWeather(cityName);
    return Weather.fromJSON(rawWeather);
  }
}
