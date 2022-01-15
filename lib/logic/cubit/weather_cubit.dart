import 'package:bloc/bloc.dart';
import 'package:flutter_wheather_bloc_basic/data/models/weather.dart';
import 'package:flutter_wheather_bloc_basic/data/repositories/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final WeatherRepository repository = WeatherRepository();

  Future<void> loading() async {
    print('tandq WeatherLoading');
    emit(WeatherLoading());
    try {
      final Weather weather = await repository.getLocationWeather();
      loaded(weather);
    } catch (error) {}
  }

  void loaded(Weather weather) {
    emit(WeatherLoaded(weatherCubit: weather));
  }
}
