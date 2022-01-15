import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_wheather_bloc_basic/core/themes/app_theme.dart';
import 'package:flutter_wheather_bloc_basic/data/models/weather.dart';
import 'package:flutter_wheather_bloc_basic/logic/cubit/weather_cubit.dart';
import 'package:flutter_wheather_bloc_basic/presentation/router/app_router.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final weatherCubit = WeatherCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //weatherCubit.loading(); //loading from init
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => weatherCubit,
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Builder(
                  builder: (context) {
                    return FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<WeatherCubit>(context).loading();
                      },
                      child: Text('Go'),
                    );
                  },
                ),
                SizedBox(height: 20.0),
                BlocBuilder<WeatherCubit, WeatherState>(
                  builder: (builderContext, state) {
                    print('tandq BlocBuilder work');
                    if (state is WeatherInitial) {
                      return Text('Clock go button to get weather');
                    } else if (state is WeatherLoading) {
                      return SpinKitCircle(
                        color: Colors.blue,
                        size: 100.0,
                      );
                    } else if (state is WeatherLoaded) {
                      Weather weather = (state as WeatherLoaded).weatherCubit;
                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pushNamed(context, AppRouter.location,
                            arguments: weather);
                      });
                      return const Text('loaded');
                    }
                    return const Text('Error');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
