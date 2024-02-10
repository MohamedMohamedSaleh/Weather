import 'package:weather/models/get_weather_model.dart';

class GetWeatherStates {}

class GetWeatherLoadingState extends GetWeatherStates {}

class GetWeatherFailedState extends GetWeatherStates {}

class GetWeatherSuccessState extends GetWeatherStates {
  final WeatherData model;

  GetWeatherSuccessState({required this.model});
}
