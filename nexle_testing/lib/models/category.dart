class TCategory {
  TCategory({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.isSelected = false,
  });

  factory TCategory.fromMap(Map<String, dynamic> json) => TCategory(
        id: json['id'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        name: json['name'],
      );

  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  bool isSelected;

  TCategory copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    bool? isSelected,
  }) =>
      TCategory(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        isSelected: isSelected ?? this.isSelected,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'name': name,
      };
}
