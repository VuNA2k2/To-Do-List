import 'package:domain/src/entities/login_entity.dart';
import 'package:domain/src/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  Future<void> call(LoginEntity loginEntity) async {
    try {
      return await _authRepository.login(loginEntity);
    } catch (e) {
      rethrow;
    }
  }
}