class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
  });

  factory RegisterRequest.fromMap(Map<String, dynamic> json) => RegisterRequest(
        email: json['email'],
        password: json['password'],
        firstName: json['firstName'],
        lastName: json['lastName'],
      );
  String email;
  String password;
  String? firstName;
  String? lastName;

  RegisterRequest copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) =>
      RegisterRequest(
        email: email ?? this.email,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      };
}
