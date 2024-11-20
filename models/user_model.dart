class UserModel {
  final int? id; // id puede ser nulo
  final String procesador;
  final String discoduro;
  final String ram;

  UserModel({
    this.id, // id es opcional
    required this.procesador,
    required this.discoduro,
    required this.ram,
  });

  UserModel copyWith({
    int? id,
    String? procesador,
    String? discoduro,
    String? ram,
  }) {
    return UserModel(
      id: id ?? this.id,
      procesador: procesador ?? this.procesador,
      discoduro: discoduro ?? this.discoduro,
      ram: ram ?? this.ram,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?,
      procesador: map['procesador'] as String? ?? '',
      discoduro: map['discoduro'] as String? ?? '',
      ram: map['ram'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id, // El id se puede omitir si es nulo
      'procesador': procesador,
      'discoduro': discoduro,
      'ram': ram,
    };
  }
}
