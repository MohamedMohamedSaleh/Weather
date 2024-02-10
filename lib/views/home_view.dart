import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/get_weather_cubit.dart';
import 'package:weather/cubit/get_weather_states.dart';
import 'package:weather/views/weather_view.dart';

import 'no_weather_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GetWeatherCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
        builder: (context, state) {
          if (state is GetWeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetWeatherSuccessState) {
            return WeatherView(
              model: state.model,
            );
          } else {
            return const NoWeather();
          }
        },
      ),
    );
  }
}
