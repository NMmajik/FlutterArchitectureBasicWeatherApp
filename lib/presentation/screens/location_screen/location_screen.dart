import 'package:flutter/material.dart';
import 'package:flutter_wheather_bloc_basic/core/constants/strings.dart';
import 'package:flutter_wheather_bloc_basic/data/models/weather.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({
    Key? key,
    required this.weather,
  }) : super(key: key);

  Weather weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.homeScreenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Weather information",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '${weather.country}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '${weather.cityName}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '${weather.temperature} *C',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
