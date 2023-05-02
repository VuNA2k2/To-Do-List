import 'package:data/data.dart';
import 'package:domain/domain.dart';

class LoginMapper {
  static LoginInputDto getInputDtoFromEntity(LoginEntity loginEntity) =>
      LoginInputDto(
        username: loginEntity.username,
        password: loginEntity.password,
      );
}