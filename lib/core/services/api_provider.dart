import 'package:dio/dio.dart';
import 'package:miniapp_telegram_final/core/constant/api_endpoint.dart';

class DioService {
  static Dio? _dio;

  static Dio? get dio {
    _dio ??= createDio();
    return _dio;
  }

  static createDio() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      maxRedirects: 3,
      receiveTimeout: Duration(seconds: 3),
      sendTimeout: Duration(seconds: 3),
      // headers: {
      //   'X-Authorization': 'sk_55663b9040f7e73b6004367406d94972ff14db6e75ea2',
      //   'Content-Type': 'application/json',
      // },
    );

    return Dio(baseOptions);
  }
}
