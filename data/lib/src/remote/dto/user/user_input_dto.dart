class UserInputDto {
//@NotNull
//     @NotEmpty
//     private String username;
//     @NotNull
//     @NotEmpty
//     private String fullName;
//
//     private Date dateOfBirth;
//     private String phoneNumber;
//     @NotNull
//     @NotEmpty
//     private String email;
//     private String avatar;

  String username;
  String fullName;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String email;
  String? avatar;

  UserInputDto({
    required this.username,
    required this.fullName,
    this.dateOfBirth,
    this.phoneNumber,
    required this.email,
    this.avatar,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'fullName': fullName,
    'dateOfBirth': dateOfBirth?.toUtc().toIso8601String(),
    'phoneNumber': phoneNumber,
    'email': email,
    'avatar': avatar,
  };
}