import 'package:equatable/equatable.dart';

class RegisterOutputDto extends Equatable {
  final String username;
  final String email;
  final String fullName;
  final DateTime? dateOfBirth;
  final String? phoneNumber;
  final String? avatar;

  RegisterOutputDto({
    required this.username,
    required this.email,
    required this.fullName,
    this.dateOfBirth,
    this.phoneNumber,
    this.avatar,
  });

  @override
  List<Object?> get props => [
        username,
      ];

  factory RegisterOutputDto.fromJson(Map<String, dynamic> json) {
    return RegisterOutputDto(
      username: json['username'],
      email: json['email'],
      fullName: json['fullName'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      phoneNumber: json['phoneNumber'],
      avatar: json['avatar'],
    );
  }
}