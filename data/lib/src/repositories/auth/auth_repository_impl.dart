import 'package:data/src/data_source/shared_data/storage_service.dart';
import 'package:data/src/remote/auth_remote.dart';
import 'package:data/src/remote/dto/login/login_mapper.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRemote _authRemote;

  AuthRepositoryImpl(this._authRemote);

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> login(LoginEntity loginEntity) async {
    final response =
        await _authRemote.login(LoginMapper.getInputDtoFromEntity(loginEntity));
    if (response.error.code == "success") {
      StorageService().saveToken = response.data?.accessToken ?? "";
      return true;
    }
    return false;
  }
}
