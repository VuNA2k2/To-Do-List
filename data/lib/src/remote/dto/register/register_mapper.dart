import 'package:data/src/remote/dto/register/register_input_dto.dart';
import 'package:data/src/remote/dto/register/register_output_dto.dart';
import 'package:domain/domain.dart';

class RegisterMapper {
  static RegisterInputDto getRegisterInputDtoFromUserEntity(
      UserEntity userEntity) {
    return RegisterInputDto(
      username: userEntity.username,
      password: userEntity.password!,
      email: userEntity.email,
      fullName: userEntity.name,
      avatar: userEntity.avatar,
      dateOfBirth: userEntity.dateOfBirth,
      phoneNumber: userEntity.phoneNumber,
    );
  }

  static UserEntity getUserEntityFromRegisterOutputDto(
      RegisterOutputDto registerOutputDto) {
    return UserEntity(
      username: registerOutputDto.username,
      email: registerOutputDto.email,
      name: registerOutputDto.fullName,
      dateOfBirth: registerOutputDto.dateOfBirth,
      phoneNumber: registerOutputDto.phoneNumber,
      avatar: registerOutputDto.avatar,
    );
  }
}
