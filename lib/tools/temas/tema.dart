class Tema {
  final int id;
  final String nome;

  Tema({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}
