class UserInfoViewModel {
  String username;
  String name;
  DateTime? dateOfBirth;
  String email;
  String? phoneNumber;
  String? avatar;

  UserInfoViewModel({
    required this.username,
    required this.name,
    this.dateOfBirth,
    required this.email,
    this.phoneNumber,
    this.avatar,
  });
}