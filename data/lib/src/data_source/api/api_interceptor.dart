import 'package:data/src/data_source/shared_data/storage_service.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
    @override
    void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
      final token = StorageService().token;
      if (token != null && token.isNotEmpty) {
        options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
      }
      super.onRequest(options, handler);
    }

    @override
    void onError(DioError err, ErrorInterceptorHandler handler) {
      handler.reject(err);
    }

    @override
    void onResponse(Response response, ResponseInterceptorHandler handler) {
      super.onResponse(response, handler);
    }
}