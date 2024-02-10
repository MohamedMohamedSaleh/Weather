import 'package:dio/dio.dart';
import 'package:weather/models/get_weather_model.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://api.weatherapi.com/v1/',
    ),
  );

  static Future<ResponseData> getData(
      {required String endPoint, Map<String, dynamic>? map}) async {
    try {
      var response = await _dio.get(endPoint, queryParameters: map);
      return ResponseData(message: 'Get Weather Successful', isSuccess: true, response: response);
    } on DioException catch (ex) {
      print(ex.response!.data['error']['message']);
      return ResponseData(
          message: ex.response!.data['error']['message'], isSuccess: false);
    }
  }
}
enum MessageType{success, failed}

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}

class Helper {
  Future<void> get() async {
    try {
      var response = await Dio().get(
          'http://api.weatherapi.com/v1/forecast.json?key=a374e16f1c114334b4d190953240502&q=London&days=1');
      var model = WeatherData.fromJson(response.data);
      print(model.cityName);
    } on DioException catch (ex) {
      print(ex.response!.data['error']['message']);
    }
  }
}
