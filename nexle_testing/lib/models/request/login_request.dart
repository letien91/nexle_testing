class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
  });

  factory LoginRequest.fromMap(Map<String, dynamic> json) => LoginRequest(
        email: json['email'],
        password: json['password'],
      );

  final String email;
  final String password;

  LoginRequest copyWith({
    String? email,
    String? password,
  }) =>
      LoginRequest(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'email': email,
        'password': password,
      };
}
