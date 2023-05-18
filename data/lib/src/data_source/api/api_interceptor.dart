import 'package:data/data.dart';
import 'package:data/src/data_source/shared_data/storage_service.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = StorageService().token;
    if (token != null && token.isNotEmpty && !options.path.contains("auth")) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403) {
      final AuthRepositoryImpl authRepositoryImpl =
          AuthRepositoryImpl(AuthRemote(ApiService()));
      StorageService().deleteToken();
      await authRepositoryImpl.refreshToken();
      final headers = err.requestOptions.headers;
      headers.remove("Authorization");
      headers.putIfAbsent(
          'Authorization', () => 'Bearer ${StorageService().token}');
      var recallOption = Options(
        method: err.requestOptions.method,
        headers: headers,
      );
      var recallResult = await ApiService().request(
        err.requestOptions.path,
        options: recallOption,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
      );
      handler.resolve(recallResult);
    } else {
      handler.reject(err);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
