import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://hris.transworld.com.eg/api/hris',
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'Application/json', 'Accept': '*/*'}));
  }

  static Future getData({required String url, Map<String, dynamic>? query, bool isAuthentication = false}) async {

    Response? res;
    try {
      res = await dio.get(url, queryParameters: query);
      return res;
    } on DioError catch (e) {
      return e;
    }
  }
}
