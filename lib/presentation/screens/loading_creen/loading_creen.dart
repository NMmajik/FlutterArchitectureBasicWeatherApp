import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_wheather_bloc_basic/core/themes/app_theme.dart';
import 'package:flutter_wheather_bloc_basic/data/repositories/weather_repository.dart';
import 'package:flutter_wheather_bloc_basic/presentation/router/app_router.dart';
import 'package:flutter_wheather_bloc_basic/presentation/screens/location_screen/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherRepository weatherRepository = WeatherRepository();
    print('tandq getting location...');
    var weatherData = await weatherRepository.getLocationWeather();
    print('tandq getting location done');
    Navigator.pushNamed(context, AppRouter.location, arguments: weatherData);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => LocationScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitCircle(
                color: Colors.blue,
                size: 100.0,
              ),
              SizedBox(height: 20.0),
              Text('Location is loading...'),
            ],
          ),
        ),
      ),
    );
  }
}
