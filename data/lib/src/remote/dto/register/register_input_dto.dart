class RegisterInputDto {

  String username;
  String password;
  String email;
  String fullName;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String? avatar;

  RegisterInputDto({
    required this.username,
    required this.password,
    required this.email,
    required this.fullName,
    this.dateOfBirth,
    this.phoneNumber,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth?.toUtc().toIso8601String(),
      'phoneNumber': phoneNumber,
      'avatar': avatar,
    };
  }

}