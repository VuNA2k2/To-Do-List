import 'package:data/src/data_source/api/api_interceptor.dart';
import 'package:data/src/data_source/api/api_path.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService extends DioMixin {
  ApiService._internal() {
    options = BaseOptions(
      baseUrl: ApiPath.host,
      connectTimeout: const Duration(milliseconds: 3000),
    );
    interceptors.addAll([
      ApiInterceptor(),
      PrettyDioLogger(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    ]);
    httpClientAdapter = IOHttpClientAdapter();
  }

  factory ApiService() => ApiService._internal();
}