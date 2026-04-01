class Machine {
  final String id;
  final String name;
  final int counter;
  final DateTime createdAt;
  final DateTime updatedAt;

  Machine({
    required this.id,
    required this.name,
    required this.counter,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'counter': counter,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Machine.fromMap(Map<String, dynamic> map) {
    return Machine(
      id: map['id'],
      name: map['name'],
      counter: map['counter'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Machine copyWith({
    String? id,
    String? name,
    int? counter,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Machine(
      id: id ?? this.id,
      name: name ?? this.name,
      counter: counter ?? this.counter,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}