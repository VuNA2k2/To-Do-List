import 'package:domain/domain.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<void> call() async {
    try {
      _authRepository.logout();
    } catch (e) {
      rethrow;
    }
  }
}
