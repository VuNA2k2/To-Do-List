import 'package:domain/src/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> getUserDetail();

  Future<UserEntity> updateUser(UserEntity userEntity);
}