import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class UserDetailOutputDto extends Equatable {

  int userId;
  String username;
  String fullName;
  DateTime? dateOfBirth;
  String? phoneNumber;
  String email;
  String? avatar;

  UserDetailOutputDto({
    required this.userId,
    required this.username,
    required this.fullName,
    this.dateOfBirth,
    this.phoneNumber,
    required this.email,
    this.avatar,
  });

  factory UserDetailOutputDto.fromJson(Map<String, dynamic> json) {
    return UserDetailOutputDto(
      userId: json['userId'],
      username: json['username'],
      fullName: json['fullName'],
      dateOfBirth: json['dateOfBirth'] != null ? DateFormat("MM/dd/yy, hh:mm a").parse(json["dateOfBirth"]) : null,
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  @override
  List<Object?> get props => [userId];
}
