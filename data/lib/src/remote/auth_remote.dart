import 'package:data/src/data_source/api/api_path.dart';
import 'package:data/src/data_source/api/api_service.dart';
import 'package:data/src/data_source/shared_data/storage_service.dart';
import 'package:data/src/remote/dto/login/login_input_dto.dart';
import 'package:data/src/remote/dto/login/login_output_dto.dart';
import 'package:data/src/remote/response/response.dart';

class AuthRemote {
  final ApiService _apiService;

  AuthRemote(this._apiService);

  Future<Response<LoginOutputDto?>> login(LoginInputDto input) async {
    final response = await _apiService.post(
      ApiPath.login,
      data: input.toJson(),
    );
    return Response.fromJson(
      response.data,
      (json) => LoginOutputDto.fromJson(json),
    );
  }

  Future<Response<LoginOutputDto?>> refreshToken() async {
    final response = await _apiService.post(
      ApiPath.refreshToken,
      data: {
        "refreshToken": StorageService().refreshToken
      },
    );
    return Response.fromJson(
      response.data,
      (json) => LoginOutputDto.fromJson(json),
    );
  }
}
