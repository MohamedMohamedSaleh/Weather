import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/dio_helper.dart';
import 'package:weather/core/helper_methods.dart';
import 'package:weather/cubit/get_weather_states.dart';

import '../models/get_weather_model.dart';

class GetWeatherCubit extends Cubit<GetWeatherStates> {
  GetWeatherCubit() : super(GetWeatherStates());
  late final cityNameController = TextEditingController();
  AutovalidateMode validate = AutovalidateMode.disabled;
  final formkey = GlobalKey<FormState>();

  // late String cityName;

  Future<void> getWeatherData() async {
    emit(GetWeatherLoadingState());
    var response = await DioHelper.getData(endPoint: 'forecast.json?',
     map: {
      'key': 'a374e16f1c114334b4d190953240502',
      'q': cityNameController.text,
      'days': '1',
    });
    if (response.isSuccess) {
      final model = WeatherData.fromJson(response.response!.data);
      showMessage(message: response.message, type: MessageType.success);
      emit(GetWeatherSuccessState(model: model));
    } else {
      showMessage(message: response.message);
      emit(GetWeatherFailedState());
    }
  }
}
