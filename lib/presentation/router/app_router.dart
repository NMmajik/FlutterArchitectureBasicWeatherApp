import 'package:flutter/material.dart';
import 'package:flutter_wheather_bloc_basic/core/constants/strings.dart';
import 'package:flutter_wheather_bloc_basic/core/exceptions/route_exception.dart';
import 'package:flutter_wheather_bloc_basic/data/models/weather.dart';
import 'package:flutter_wheather_bloc_basic/presentation/screens/loading_creen/loading_creen.dart';
import 'package:flutter_wheather_bloc_basic/presentation/screens/location_screen/location_screen.dart';

class AppRouter {
  static const String location = 'location';
  static const String loading = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loading:
        return MaterialPageRoute(
          builder: (_) => LoadingScreen(),
        );
      case location:
        return MaterialPageRoute(
          builder: (_) => LocationScreen(weather: settings.arguments as Weather),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
