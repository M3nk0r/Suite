class Category {
  final String id;
  final String userId;
  final String name;
  final String color;

  Category({
    required this.id,
    required this.userId,
    required this.name,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'userId': userId, 'name': name, 'color': color,};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
      color: map['color'] as String,
    );
  }



}
