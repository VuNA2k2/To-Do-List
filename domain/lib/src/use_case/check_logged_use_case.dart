import 'package:domain/domain.dart';

class CheckLoggedUseCase {
  final AuthRepository _authRepository;
  CheckLoggedUseCase(this._authRepository);

  bool call() {
    return _authRepository.isLoggedIn();
  }
}