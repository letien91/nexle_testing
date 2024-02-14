import 'package:nexle_testing/models/user.dart';

class LoginResponse {
  LoginResponse({
    required this.user,
    required this.refreshToken,
    required this.accessToken,
  });

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        user: User.fromMap(json['user']),
        refreshToken: json['refreshToken'],
        accessToken: json['accessToken'],
      );

  final User user;
  final String accessToken;
  final String refreshToken;

  LoginResponse copyWith({
    User? user,
    String? refreshToken,
    String? accessToken,
  }) =>
      LoginResponse(
        user: user ?? this.user,
        refreshToken: refreshToken ?? this.refreshToken,
        accessToken: accessToken ?? this.accessToken,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'user': user.toMap(),
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}
