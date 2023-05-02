import 'dart:developer';

import 'package:data/src/data_source/api/api_path.dart';
import 'package:data/src/data_source/api/api_service.dart';
import 'package:data/src/remote/dto/login/login_input_dto.dart';
import 'package:data/src/remote/dto/login/login_output_dto.dart';
import 'package:data/src/remote/response/response.dart';
import 'package:data/src/remote/response/response_error.dart';

class AuthRemote {
  final ApiService _apiService;
  AuthRemote(this._apiService);
  Future<Response<LoginOutputDto>> login(LoginInputDto input) async {
    try {
      final response = await _apiService.post(
        ApiPath.login,
        data: input.toJson(),
      );
      return Response.fromJson(
        response.data,
            (json) => LoginOutputDto.fromJson(json),
      );
    } catch (e) {
      log(e.toString());
    }
    return Response(error: ResponseError(code: "", message: "error"), data: null);
  }
}