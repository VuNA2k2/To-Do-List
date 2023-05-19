import 'package:domain/domain.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;
  RegisterUseCase(this._authRepository);

  Future<UserEntity?> call({required UserEntity userEntity}) {
    try {
      return _authRepository.createAccount(userEntity: userEntity);
    } catch (e) {
      rethrow;
    }
  }

}