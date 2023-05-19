import 'package:domain/src/entities/user_entity.dart';
import 'package:domain/src/repositories/user_repository.dart';

class GetUserDetailUseCase {
  final UserRepository _userRepository;
  GetUserDetailUseCase(this._userRepository);
  Future<UserEntity?> call() {
    try {
      return _userRepository.getUserDetail();
    } catch (e) {
      rethrow;
    }
  }
}