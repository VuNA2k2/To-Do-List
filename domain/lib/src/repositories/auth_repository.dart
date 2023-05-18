import 'package:domain/src/entities/login_entity.dart';

abstract class AuthRepository {
  Future<void> login(LoginEntity loginEntity);
  void logout();
  bool isLoggedIn();
  Future<void> refreshToken();
}