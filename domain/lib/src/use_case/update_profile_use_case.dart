import 'package:domain/domain.dart';

class UpdateProfileUseCase {
  final UserRepository _userRepository;

  UpdateProfileUseCase(this._userRepository);

  Future<UserEntity?> call(UserEntity userEntity) async {
    try {
      return await _userRepository.updateUser(userEntity);
    } catch (e) {
      rethrow;
    }
  }
}