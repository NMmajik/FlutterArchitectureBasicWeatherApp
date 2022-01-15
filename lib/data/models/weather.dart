import 'dart:convert';

class Weather {
  Weather({
    this.temperature = 0,
    this.cityName = '',
    this.country = '',
  });
  int temperature;
  String cityName;
  String country;

  static Weather fromJSON(String rawWeather) {
    final jsonData = jsonDecode(rawWeather);
    return Weather(
        temperature: jsonData['main']['temp'].toInt(),
        cityName: jsonData['name'],
        country: jsonData['sys']['country']);
  }
}
