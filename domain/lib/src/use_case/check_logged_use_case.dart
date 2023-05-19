import 'package:domain/domain.dart';

class CheckLoggedUseCase {
  final AuthRepository _authRepository;
  CheckLoggedUseCase(this._authRepository);

  bool call() {
    try {
      return _authRepository.isLoggedIn();
    } catch (e) {
      rethrow;
    }
  }
}