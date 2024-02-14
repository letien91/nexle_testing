import 'package:nexle_testing/models/user.dart';

class RegisterResponse {
  RegisterResponse({
    required this.user,
  });

  factory RegisterResponse.fromMap(Map<String, dynamic> json) =>
      RegisterResponse(
        user: User.fromMap(json),
      );

  final User user;

  RegisterResponse copyWith({
    User? user,
  }) =>
      RegisterResponse(
        user: user ?? this.user,
      );

  Map<String, dynamic> toMap() => user.toMap();
}
