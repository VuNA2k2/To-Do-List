import 'package:domain/domain.dart';
import 'package:todo_list/views/fill_profile/view_model/user_info_view_model.dart';

class UserInfoMapper {
  static UserInfoViewModel getUserInfoViewModelFromUserEntity(
      UserEntity userEntity) {
    return UserInfoViewModel(
      name: userEntity.name,
      email: userEntity.email,
      avatar: userEntity.avatar,
      dateOfBirth: userEntity.dateOfBirth,
      phoneNumber: userEntity.phoneNumber,
    );
  }
}
