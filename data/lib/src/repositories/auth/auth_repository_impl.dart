import 'package:data/src/data_source/shared_data/storage_service.dart';
import 'package:data/src/remote/auth_remote.dart';
import 'package:data/src/remote/dto/login/login_mapper.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote _authRemote;

  AuthRepositoryImpl(this._authRemote);

  @override
  bool isLoggedIn() {
    return StorageService().isLogged ?? false;
  }

  @override
  void logout() {
    StorageService().deleteToken();
    StorageService().deleteRefreshToken();
    StorageService().deleteIsLogged();
  }

  @override
  Future<void> login(LoginEntity loginEntity) async {
    final response =
        await _authRemote.login(LoginMapper.getInputDtoFromEntity(loginEntity));
    if (response.error.code == "success") {
      StorageService().saveToken = response.data?.accessToken ?? "";
      StorageService().saveRefreshToken = response.data?.refreshToken ?? "";
      StorageService().saveIsLogged = true;
    }
  }

  @override
  Future<void> refreshToken() async {
    final response = await _authRemote.refreshToken();
    if (response.error.code == "success") {
      StorageService().saveToken = response.data?.accessToken ?? "";
      StorageService().saveRefreshToken = response.data?.refreshToken ?? "";
    }
  }
}
