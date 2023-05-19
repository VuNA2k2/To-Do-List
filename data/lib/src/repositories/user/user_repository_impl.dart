import 'package:data/data.dart';
import 'package:data/src/remote/dto/user/user_mapper.dart';
import 'package:data/src/remote/user_remote.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemote _userRemote;
  UserRepositoryImpl(this._userRemote);
  @override
  Future<UserEntity?> getUserDetail() async {
    final res = await _userRemote.getUserDetail();
    if(res.error.code == 'success') {
      return UserMapper.getUserEntityFromUserDetailOutputDto(res.data!);
    } else {
      throw RestException(res.error.message);
    }
  }

  @override
  Future<UserEntity> updateUser(UserEntity userEntity) async {
    final res = await _userRemote.updateUser(UserMapper.getUserInputDtoFromUserEntity(userEntity));
    if(res.error.code == 'success') {
      return UserMapper.getUserEntityFromUserDetailOutputDto(res.data!);
    } else {
      throw RestException(res.error.message);
    }
  }

}