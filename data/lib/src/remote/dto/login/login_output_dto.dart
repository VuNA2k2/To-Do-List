class LoginOutputDto {
  final String accessToken;
  final String refreshToken;
  LoginOutputDto({required this.accessToken, required this.refreshToken});
  factory LoginOutputDto.fromJson(Map<String, dynamic> json) {
    return LoginOutputDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}