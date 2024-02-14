class User {
  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.firstName,
    this.lastName,
    this.role,
  });

  factory User.fromMap(Map<String, dynamic> json) =>
      User(
        id: json['id'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']),
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        role: json['role'],
      );

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? email;
  String? firstName;
  String? lastName;
  String? role;

  User copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? email,
    String? firstName,
    String? lastName,
    String? role,
  }) =>
      User(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        role: role ?? this.role,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'role': role,
      };
}
