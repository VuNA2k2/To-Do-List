import 'package:domain/domain.dart';
import 'package:todo_list/views/sign_up/view_model/account_view_model.dart';
import 'package:todo_list/views/fill_profile/view_model/user_info_view_model.dart';

class SignUpMapper {
  static UserEntity getUserEntityFromAccountViewModelAndUserInfoViewModel({
    required AccountViewModel accountViewModel,
    required UserInfoViewModel userInfoViewModel,
  }) {
    return UserEntity(
      username: accountViewModel.username,
      password: accountViewModel.password,
      email: userInfoViewModel.email,
      name: userInfoViewModel.name,
      dateOfBirth: userInfoViewModel.dateOfBirth,
      phoneNumber: userInfoViewModel.phoneNumber,
      avatar: userInfoViewModel.avatar,
    );
  }

  static UserEntity getUserEntityFromUserInfoViewModel(UserInfoViewModel userInfoViewModel) {
    return UserEntity(
      username: userInfoViewModel.username,
      email: userInfoViewModel.email,
      name: userInfoViewModel.name,
      dateOfBirth: userInfoViewModel.dateOfBirth,
      phoneNumber: userInfoViewModel.phoneNumber,
      avatar: userInfoViewModel.avatar,
    );
  }
}