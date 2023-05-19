import 'package:data/data.dart';
import 'package:data/src/data_source/api/api_path.dart';
import 'package:data/src/remote/dto/user/user_input_dto.dart';
import 'package:data/src/remote/response/response.dart';

import 'dto/user/user_detail_output_dto.dart';

class UserRemote {
  ApiService _apiService;
  UserRemote(this._apiService);
  Future<Response<UserDetailOutputDto>> getUserDetail() async {
    final res = await _apiService.get(
      ApiPath.userDetail,
    );
    return Response.fromJson(res.data, (json) => UserDetailOutputDto.fromJson(json));
  }

  Future<Response<UserDetailOutputDto>> updateUser(UserInputDto userInputDtoFromUserEntity) async {
    final res = await _apiService.put(
      ApiPath.users,
      data: userInputDtoFromUserEntity.toJson(),
    );
    return Response.fromJson(res.data, (json) => UserDetailOutputDto.fromJson(json));
  }
}