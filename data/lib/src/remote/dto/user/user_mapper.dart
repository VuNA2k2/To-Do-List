import 'package:data/src/remote/dto/user/user_detail_output_dto.dart';
import 'package:domain/domain.dart';

class UserMapper {
  static UserEntity getUserEntityFromUserDetailOutputDto(UserDetailOutputDto userDetailOutputDto){
    return UserEntity(
      id: userDetailOutputDto.userId,
      name: userDetailOutputDto.fullName,
      email: userDetailOutputDto.email,
      avatar: userDetailOutputDto.avatar,
      dateOfBirth: userDetailOutputDto.dateOfBirth,
      phoneNumber: userDetailOutputDto.phoneNumber,
      username: userDetailOutputDto.username,
    );
  }
}