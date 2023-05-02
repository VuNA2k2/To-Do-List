import 'package:data/src/remote/response/response_error.dart';

class Response<T> {
  ResponseError error;
  T? data;

  Response({required this.error, this.data});

  factory Response.fromJson(
    Map<String, dynamic> json,
    T? Function(Map<String, dynamic> json)? fromJson,
  ) {
    return Response(
      error: ResponseError.fromJson(json['error']),
      data: fromJson?.call(
        json['data'],
      ),
    );
  }
}
