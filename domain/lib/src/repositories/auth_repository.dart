import 'package:domain/src/entities/login_entity.dart';

abstract class AuthRepository {
  Future<bool> login(LoginEntity loginEntity);
  Future<bool> logout();
  Future<bool> isLoggedIn();
}