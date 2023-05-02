class LoginInputDto {
  final String username;
  final String password;

  LoginInputDto({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}