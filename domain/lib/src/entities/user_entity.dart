class UserEntity {
  final String username;
  final String? password;
  final String name;
  final String? avatar;
  final String email;
  final DateTime? dateOfBirth;
  final String? phoneNumber;

  UserEntity({
    required this.username,
    this.password,
    required this.name,
    this.avatar,
    required this.email,
    this.dateOfBirth,
    this.phoneNumber,
  });
}