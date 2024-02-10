import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://api.weatherapi.com/v1/',
    ),
  );

  static Future<ResponseData> getData(
      {required String endPoint, Map<String, dynamic>? map}) async {
    try {
      // var rrr = await Dio().get('path', queryParameters: {'key': '', ''});

      var response = await _dio.get(endPoint, queryParameters: map);
      return ResponseData(
          message: 'Get Weather Successful',
          isSuccess: true,
          response: response);
    } on DioException catch (ex) {
      return ResponseData(
          message: ex.response!.data['error']['message'], isSuccess: false);
    }
  }
}

enum MessageType { success, failed }

class ResponseData {
  late final String message;
  late final bool isSuccess;
  late final Response? response;

  ResponseData({required this.message, required this.isSuccess, this.response});
}


